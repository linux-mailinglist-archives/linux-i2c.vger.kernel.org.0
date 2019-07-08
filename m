Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7C762689
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2019 18:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730423AbfGHQmF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Jul 2019 12:42:05 -0400
Received: from ns.iliad.fr ([212.27.33.1]:46746 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730383AbfGHQmF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Jul 2019 12:42:05 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 979F920BC5;
        Mon,  8 Jul 2019 18:42:02 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 72279208E6;
        Mon,  8 Jul 2019 18:42:02 +0200 (CEST)
Subject: Re: [RFC] SW connection between DVB Transport Stream demuxer and
 I2C-based frontend
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
To:     I2C <linux-i2c@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        GPIO <linux-gpio@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        Brad Love <brad@nextdimension.cc>,
        Antti Palosaari <crope@iki.fi>,
        Olli Salonen <olli.salonen@iki.fi>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Simon Horman <horms+renesas@verge.net.au>,
        Peter Korsgaard <peter@korsgaard.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <5e35b4fb-646d-6428-f372-ee47d7352cd6@free.fr>
Message-ID: <4b9c5a48-aaed-5f1f-1835-167fcdcb7655@free.fr>
Date:   Mon, 8 Jul 2019 18:42:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5e35b4fb-646d-6428-f372-ee47d7352cd6@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Mon Jul  8 18:42:02 2019 +0200 (CEST)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/07/2019 13:08, Marc Gonzalez wrote:

> PROBLEM #1
> 
> The media framework requires that the TSIF and demod be "tied" together,
> by calling dvb_register_frontend(). If I do that in tsif.c, then I need to
> get the frontend pointer from the demod at some point. There is no such
> callback presently. Since si2168 lives on an I2C bus, I can get a
> struct i2c_client pointer, through the DT phandle. But some kind of
> abstraction is missing to query the i2c_client object to make sure it
> is a demodulator and request its frontend pointer.
> 
> For the time being, I have added a very generic pointer to struct i2c_client
> but I feel this is not quite right... (though it gets the job done)

As far as PROBLEM #1 is concerned, I think I have a better solution;
one that doesn't involve messing with struct i2c_client.

Basically, we embed a common struct in every demod driver, at the
beginning of their private control struct. That way, demod consumers
have a generic/common data type to inspect, and don't need to know
the specific demod they are working with. (I left the removals in
the diff below, to show the two proposed solutions so far.)

@linux-media maintainers, I think this solution is acceptable for
mainline, right?

Regards.



diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index 726bb6759315..692f3207cd9d 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -666,12 +666,6 @@ struct si2168_config si2168_config;
 struct si2157_config si2157_config;
 struct i2c_client *tuner;
 
-static void *get_fe(struct i2c_client *client)
-{
-	struct si2168_dev *dev = i2c_get_clientdata(client);
-	return &dev->fe;
-}
-
 static int si2168_probe(struct i2c_client *client,
 		const struct i2c_device_id *id)
 {
@@ -700,7 +694,7 @@ static int si2168_probe(struct i2c_client *client,
 		goto err;
 	}
 
-	client->get_something = get_fe;
+	dev->common.fe = &dev->fe;
 	i2c_set_clientdata(client, dev);
 	mutex_init(&dev->i2c_mutex);
 
diff --git a/drivers/media/dvb-frontends/si2168_priv.h b/drivers/media/dvb-frontends/si2168_priv.h
index 804d5b30c697..2e69080f8a1c 100644
--- a/drivers/media/dvb-frontends/si2168_priv.h
+++ b/drivers/media/dvb-frontends/si2168_priv.h
@@ -22,6 +22,7 @@
 
 /* state struct */
 struct si2168_dev {
+	struct dvb_demod_common common;
 	struct mutex i2c_mutex;
 	struct i2c_mux_core *muxc;
 	struct dvb_frontend fe;
diff --git a/drivers/media/platform/tsif.c b/drivers/media/platform/tsif.c
index a0118c2ee870..c13fa19c9779 100644
--- a/drivers/media/platform/tsif.c
+++ b/drivers/media/platform/tsif.c
@@ -237,6 +237,7 @@ static int msm_tspp_probe(struct platform_device *pdev)
 	{
 		struct device_node *tsif_node, *demod_node;
 		struct i2c_client *demod;
+		struct dvb_demod_common *demod_data;
 
 		tsif_node = pdev->dev.of_node;
 		demod_node = of_parse_phandle(tsif_node, "demod", 0);
@@ -244,10 +245,8 @@ static int msm_tspp_probe(struct platform_device *pdev)
 		demod = of_find_i2c_device_by_node(demod_node);
 		if (!demod) panic("of_find_i2c_device_by_node");
 
-		/*** TODO: Improve callback naming & handling ***/
-		if (!demod->get_something)
-			panic("Wrong i2c_client");
-		my_dvb_frontend = demod->get_something(demod);
+		demod_data = i2c_get_clientdata(demod);
+		my_dvb_frontend = demod_data->fe;
 		of_node_put(demod_node);
 	}
 
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 5fca596e0dd0..e982b8913b73 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -295,8 +295,6 @@ struct i2c_driver {
 };
 #define to_i2c_driver(d) container_of(d, struct i2c_driver, driver)
 
-typedef void *generic_func(struct i2c_client *this);
-
 /**
  * struct i2c_client - represent an I2C slave device
  * @flags: I2C_CLIENT_TEN indicates the device uses a ten bit chip address;
@@ -330,7 +328,6 @@ struct i2c_client {
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	i2c_slave_cb_t slave_cb;	/* callback for slave mode	*/
 #endif
-	generic_func *get_something;
 };
 #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
 
diff --git a/include/media/dvb_frontend.h b/include/media/dvb_frontend.h
index f05cd7b94a2c..087486bc027e 100644
--- a/include/media/dvb_frontend.h
+++ b/include/media/dvb_frontend.h
@@ -73,6 +73,10 @@ struct dvb_frontend_tune_settings {
 
 struct dvb_frontend;
 
+struct dvb_demod_common {
+	struct dvb_frontend *fe;
+};
+
 /**
  * struct dvb_tuner_info - Frontend name and min/max ranges/bandwidths
  *
