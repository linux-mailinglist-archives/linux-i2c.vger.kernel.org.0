Return-Path: <linux-i2c+bounces-14361-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B8BC9A9E4
	for <lists+linux-i2c@lfdr.de>; Tue, 02 Dec 2025 09:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2FC3E3457B3
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Dec 2025 08:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A56F3074B0;
	Tue,  2 Dec 2025 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5waOg13"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A06730649B
	for <linux-i2c@vger.kernel.org>; Tue,  2 Dec 2025 08:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764663075; cv=none; b=C/IaQYd44Kt62HHVZMbjaGkC/HWAhECXhMVm/+vGuc05W5I5abf6mu713GAJGFJ17x1Fh0fgWGjMKW85nGJNtRlk3eMc3R9wkBGlR/oHU2jpfUSbAffNoo6j922ogyKaW9NX0zb6pXWyPAkuWExNRgRaRXfZxr8aUKZ2RSsrNdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764663075; c=relaxed/simple;
	bh=o4Zt8X+zyI6wUYVNms/IgvHSL1cE9RhNZwSvJA7JohU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tO54nT8lAOBTQPrl/8AK+FpROfFPmUF7ajPiR3NTVS/CZzbmObmSEhEAsiO1XpvyDIF/Kk05AdNw6saILHALwLS6B4sIM5WWCPcrPE7MHu0K6+Jz6nutprNSyYO8ypBi2xdfjm6HjOqmaO9frYp1cOc3fCWCWVjJrqL4byr+uU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5waOg13; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5942b58ac81so2785065e87.2
        for <linux-i2c@vger.kernel.org>; Tue, 02 Dec 2025 00:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764663070; x=1765267870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Isv7N56R7GLLyxOJRI4a7jcx/LSO3hI5hjNg+m1oWY=;
        b=V5waOg13nm7q7PMQUHQnwix1WcxKrZB3EXDgGXAYMjDgiIwBILVlL0+G52ByL+nP39
         2eD/ID6Mn1wGhK7/HkFNIb9vPWgMAhtqd+Z4Fzgq16XfU44q2/td1PzuRoPSjBCuwA7a
         mbDztkLQXn08A055ZkYkcInu9Ai4ZqQDbNdWD6A/sF8XPs2qFq+LHd6yZT2dJvzP2Wru
         oy88tRJpMyEGh39tZXOa17V4+AYO5yjxADgs1MSpbYuak9Hw8ToNn+5j4XFDDG5Tc+9g
         /MQGrvDAE31JjZc26dA9fKU/CkJjw4i3Dzk5XMbl+foEPhoIOWtFYvUdKP7oFTMSLaqr
         FojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764663070; x=1765267870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Isv7N56R7GLLyxOJRI4a7jcx/LSO3hI5hjNg+m1oWY=;
        b=tYyMspizJWLsQu5owjsJzf4g6pgXy4e/3RUFOMtokQ8XXpOcLdp/cLnIWTFLSIHNeB
         qFthS0Tc7sww88yfGiAaiinh2Unt3MXWcp1yCnxiEBUXSe4nC0JqmN9/qJDB/lsBllv1
         J8afzA6s9/Dy9d/ARSenDh/HE725HPhSMzJ5Egypc5xam3g2K5HD+u952T3EOuHxQpnM
         YqdMkTExkeQ7Qyk4AqXzUprZnIbm291aEO9l1i61b2Yge+ETsNKtpL57Xhaoc24VZdZG
         o18ETBeqkdpSmWeIyOYA2SZ0LoYDa9B6qG75AbKSSleQKDBi2PvHd1SwuMrXXhYis1bl
         IksA==
X-Gm-Message-State: AOJu0Yw7GGKY1SvnkwzYdOlN1pc4MvzgfA9fslg+GueEZXWLucXeqPgL
	DaUpm6XG+rM/HnF9DlBPphpCAmQbyh2/8Jng6BDU9qSZ5nw6Z5MBhqbPuKpV8ywA
X-Gm-Gg: ASbGncsHCUh9a3QQnmv2qr0Hd21YA/KwPh+ZgX841aTbPk1yfH6xx0ACrvSlTFiUHrp
	y5jj7LWWn8RKeFxXfybAGca+9VJWdJ+/9IQom+ebX7ysrc3kJO+a0VjTJNnvWFJPDR6MNN0IMFi
	4N7etH3zX3GiYN6bEQwcJfpoueFh2MCssJzvTdl/h9Li5KoVaulc+gmld6iRjlkJqXlvF08ipL6
	VeQzRnDdHbiWQu21YVUTHo2r2MPndCgz/XIvmTmU1abDaJYt4LzQhu0svoXLIKQev3Jt1S/BT6G
	F37BQfQFHTHU8G7UqVYTP+hnAIYlawpd+bPRXkfQW9nAcJyabT++HWGe6YNqY9rxhZ35CfpS3YH
	6M+QvxRI9qC9aOYn8MjGp4p+4gn7hhHetZwjzk92cSZQWV44ywwBuGnsPuKJjTD9UR7TYpNLDi9
	vOgtP+UETGSvHME0QhLlDXRnnRhObxTsTrIvb1oIgteZmDL4toCMh7x26o
X-Google-Smtp-Source: AGHT+IHkt5mBmHjh8rKVDEwEazUYb3LbQJH9Zf4gjO1RvE5cDpXQpDFmQNw8GIcrE1CEb2c7kqd9CQ==
X-Received: by 2002:a05:6512:696:b0:595:81e1:2d00 with SMTP id 2adb3069b0e04-596a3e565b8mr17685671e87.0.1764663070131;
        Tue, 02 Dec 2025 00:11:10 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa4f8a2sm4342412e87.88.2025.12.02.00.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 00:11:09 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 02 Dec 2025 09:09:49 +0100
Subject: [PATCH RESEND v3 2/5] i2c: mux: add support for per channel bus
 frequency
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-i2c-mux-v3-2-877dcf478a9f@gmail.com>
References: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
In-Reply-To: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7461;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=o4Zt8X+zyI6wUYVNms/IgvHSL1cE9RhNZwSvJA7JohU=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpLp8GR85xUVqPcFCzvjQEr/w1FRhbGmHJa4NlI
 JK1I2W1EvaJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaS6fBgAKCRCIgE5vWV1S
 MkYxD/45TAxdHFF8XrvCWZ7OBTehcN0YcL1u2e8zUHg+1dKZkoOEaCpyNIqpNfT49w62Psid0rC
 Iybl0QZLD2w46eRd2booPOZ/n4LnRaFLPGFfQSa41W2JmUFO0a8n5TqeLrUmNbi0kUtOVAnEL89
 S2nN7rMbp5QFFJ/l7Zq/RAm81mwUBz79mw3NJht8N2qC/xvw2KXVnAs0YmiAOIdXPfPiP5iu2RL
 RUJMIt3IPz6VRkxR1BLvr6wp6Uvwg6+DseVerX6J8bcWMh80yM7AYIVcu0MMj9EX88Bnjsqo0eN
 3LFgiIu1CsvOExEuqr+CkV78Joi6kaiJJ8AVompM7kFF7bSOGxJza/NsBMXuPhqFpCSDLdP33cn
 4I0urkVV4oeukp9fU5NK6+jAehTRoETVvYAUWFggjaulf3FLK3acl7/QMBOEnsqXyqoexO3fMOR
 r9oksT2jly2JEOmmnJ1CeqIeE8zQHaqlGLjfGj4G/uqY62M+S+TC1Dre2dXGVLyBRoKrtilEfHG
 LRBtlObeenMVd9SVpByUcJIgQ1sRqmouM1qNJBd59kBN4md+6P0U9nFjtRurlQuqpM4sRoiXVzL
 qZb50k9f3VTkAf7b21Vw3mnPLzaigHwKaNkirDgFsSYkXEynpioQTJhYzEAww9WPxyG29yHkswk
 rq6omxzUuVey4xg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

There may be several reasons why you may need to use a certain speed
on an I2C bus. E.g.

- When several devices are attached to the bus, the speed must be
  selected according to the slowest device.

- Electrical conditions may limit the usuable speed on the bus for
  different reasons.

With an I2C multiplexer, it is possible to group the attached devices
after their preferred speed by e.g. put all "slow" devices on a separate
channel on the multiplexer.

Consider the following topology:

                      .----------. 100kHz .--------.
    .--------. 400kHz |          |--------| dev D1 |
    |  root  |--+-----| I2C MUX  |        '--------'
    '--------'  |     |          |--. 400kHz .--------.
                |     '----------'  '-------| dev D2 |
                |  .--------.               '--------'
                '--| dev D3 |
                   '--------'

One requirement with this design is that a multiplexer may only use the
same or lower bus speed as its parent.
Otherwise, if the multiplexer would have to increase the bus frequency,
then all siblings (D3 in this case) would run into a clock speed it may
not support.

The bus frequency for each channel is set in the devicetree. As the
i2c-mux bindings import the i2c-controller schema, the clock-frequency
property is already allowed.
If no clock-frequency property is set, the channel inherit their parent
bus speed.

The following example uses dt bindings to illustrate the topology above:

    i2c {
	clock-frequency = <400000>;

        i2c-mux {
            i2c@0 {
                clock-frequency = <100000>;

                D1 {
                    ...
                };
            };

            i2c@1 {
                D2 {
                  ...
                };
            };
        };

        D3 {
            ...
        }
    };

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/i2c-mux.c | 116 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 104 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 4d8690981a55..67ba33a13dde 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -36,6 +36,72 @@ struct i2c_mux_priv {
 	u32 chan_id;
 };
 
+static int i2c_mux_select_chan(struct i2c_adapter *adap, u32 chan_id)
+{
+	struct i2c_mux_priv *priv = adap->algo_data;
+	struct i2c_mux_core *muxc = priv->muxc;
+	struct i2c_adapter *parent = muxc->parent;
+	struct i2c_adapter *root;
+	int ret;
+
+	if (priv->adap.clock_hz && priv->adap.clock_hz != parent->clock_hz) {
+		root = i2c_root_adapter(&adap->dev);
+
+		/* if we are parent-locked and the root adapter is our parent,
+		 * we already have the lock we need. Otherwise take the bus lock for the root
+		 * adaper before changing bus clock.
+		 */
+		if ((root != parent && !muxc->mux_locked) || muxc->mux_locked)
+			i2c_lock_bus(parent, I2C_LOCK_ROOT_ADAPTER);
+
+		ret = i2c_adapter_set_clk_freq(root, priv->adap.clock_hz);
+
+		if ((root != parent && !muxc->mux_locked) || muxc->mux_locked)
+			i2c_unlock_bus(parent, I2C_LOCK_ROOT_ADAPTER);
+
+		if (ret < 0) {
+			dev_err(&adap->dev,
+				"Failed to set clock frequency %dHz on root adapter %s: %d\n",
+				priv->adap.clock_hz, root->name, ret);
+
+			return ret;
+		}
+	}
+
+	return muxc->select(muxc, priv->chan_id);
+}
+
+static void i2c_mux_deselect_chan(struct i2c_adapter *adap, u32 chan_id)
+{
+	struct i2c_mux_priv *priv = adap->algo_data;
+	struct i2c_mux_core *muxc = priv->muxc;
+	struct i2c_adapter *parent = muxc->parent;
+	struct i2c_adapter *root;
+	int ret;
+
+	if (parent->clock_hz && parent->clock_hz != priv->adap.clock_hz) {
+		root = i2c_root_adapter(&parent->dev);
+
+		/* if we are parent-locked and the root adapter is our parent,
+		 * we already have the lock we need. Otherwise take the bus lock for the root
+		 * adaper before changing bus clock.
+		 */
+		if ((root != parent && !muxc->mux_locked) || muxc->mux_locked)
+			i2c_lock_bus(parent, I2C_LOCK_ROOT_ADAPTER);
+
+		ret = i2c_adapter_set_clk_freq(root, parent->clock_hz);
+
+		if ((root != parent && !muxc->mux_locked) || muxc->mux_locked)
+			i2c_unlock_bus(parent, I2C_LOCK_ROOT_ADAPTER);
+
+		if (ret < 0)
+			return;
+	}
+
+	if (muxc->deselect)
+		muxc->deselect(muxc, priv->chan_id);
+}
+
 static int __i2c_mux_master_xfer(struct i2c_adapter *adap,
 				 struct i2c_msg msgs[], int num)
 {
@@ -46,11 +112,11 @@ static int __i2c_mux_master_xfer(struct i2c_adapter *adap,
 
 	/* Switch to the right mux port and perform the transfer. */
 
-	ret = muxc->select(muxc, priv->chan_id);
+	ret = i2c_mux_select_chan(adap, priv->chan_id);
 	if (ret >= 0)
 		ret = __i2c_transfer(parent, msgs, num);
-	if (muxc->deselect)
-		muxc->deselect(muxc, priv->chan_id);
+
+	i2c_mux_deselect_chan(adap, priv->chan_id);
 
 	return ret;
 }
@@ -65,11 +131,11 @@ static int i2c_mux_master_xfer(struct i2c_adapter *adap,
 
 	/* Switch to the right mux port and perform the transfer. */
 
-	ret = muxc->select(muxc, priv->chan_id);
+	ret = i2c_mux_select_chan(adap, priv->chan_id);
 	if (ret >= 0)
 		ret = i2c_transfer(parent, msgs, num);
-	if (muxc->deselect)
-		muxc->deselect(muxc, priv->chan_id);
+
+	i2c_mux_deselect_chan(adap, priv->chan_id);
 
 	return ret;
 }
@@ -86,12 +152,12 @@ static int __i2c_mux_smbus_xfer(struct i2c_adapter *adap,
 
 	/* Select the right mux port and perform the transfer. */
 
-	ret = muxc->select(muxc, priv->chan_id);
+	ret = i2c_mux_select_chan(adap, priv->chan_id);
 	if (ret >= 0)
 		ret = __i2c_smbus_xfer(parent, addr, flags,
 				       read_write, command, size, data);
-	if (muxc->deselect)
-		muxc->deselect(muxc, priv->chan_id);
+
+	i2c_mux_deselect_chan(adap, priv->chan_id);
 
 	return ret;
 }
@@ -108,12 +174,12 @@ static int i2c_mux_smbus_xfer(struct i2c_adapter *adap,
 
 	/* Select the right mux port and perform the transfer. */
 
-	ret = muxc->select(muxc, priv->chan_id);
+	ret = i2c_mux_select_chan(adap, priv->chan_id);
 	if (ret >= 0)
 		ret = i2c_smbus_xfer(parent, addr, flags,
 				     read_write, command, size, data);
-	if (muxc->deselect)
-		muxc->deselect(muxc, priv->chan_id);
+
+	i2c_mux_deselect_chan(adap, priv->chan_id);
 
 	return ret;
 }
@@ -365,6 +431,32 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 			}
 		}
 
+		of_property_read_u32(child, "clock-frequency", &priv->adap.clock_hz);
+
+		/*
+		 * Warn if the mux adapter is not parent-locked as
+		 * this may cause issues for some hardware topologies.
+		 */
+		if ((priv->adap.clock_hz < parent->clock_hz) && muxc->mux_locked)
+			dev_warn(muxc->dev,
+				 "channel %u is slower than parent on a non parent-locked mux\n",
+				 chan_id);
+
+		/* If the mux adapter has no clock-frequency property, inherit from parent */
+		if (!priv->adap.clock_hz)
+			priv->adap.clock_hz = parent->clock_hz;
+
+		/* We don't support mux adapters faster than their parent */
+		if (priv->adap.clock_hz > parent->clock_hz) {
+			dev_err(muxc->dev,
+				"channel (%u) is faster (%u) than parent (%u)\n",
+				chan_id, priv->adap.clock_hz, parent->clock_hz);
+
+			of_node_put(mux_node);
+			ret = -EINVAL;
+			goto err_free_priv;
+		}
+
 		priv->adap.dev.of_node = child;
 		of_node_put(mux_node);
 	}

-- 
2.51.2


