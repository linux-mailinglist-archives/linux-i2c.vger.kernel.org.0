Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37B6C23D254
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 22:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729721AbgHEULu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 16:11:50 -0400
Received: from 10.mo173.mail-out.ovh.net ([46.105.74.148]:53191 "EHLO
        10.mo173.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729685AbgHEULp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 16:11:45 -0400
X-Greylist: delayed 2996 seconds by postgrey-1.27 at vger.kernel.org; Wed, 05 Aug 2020 16:11:44 EDT
Received: from player731.ha.ovh.net (unknown [10.108.57.76])
        by mo173.mail-out.ovh.net (Postfix) with ESMTP id 4DF21145861
        for <linux-i2c@vger.kernel.org>; Wed,  5 Aug 2020 20:31:58 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player731.ha.ovh.net (Postfix) with ESMTPSA id 9951514D3469E;
        Wed,  5 Aug 2020 18:31:54 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-104R005aa1e33ce-4bf9-4223-8d07-e3f378d047ee,
                    61EB5F03F455356FFDEC3EC2AC7AFDA20CE2F8AD) smtp.auth=steve@sk2.org
From:   Stephen Kitt <steve@sk2.org>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH] docs: remove the 2.6 "Upgrading I2C Drivers" guide
Date:   Wed,  5 Aug 2020 20:31:49 +0200
Message-Id: <20200805183149.21647-1-steve@sk2.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 18094618878727245250
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrjeekgdduvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeetgedugfelkeeikeetgeegteevfeeufeetuefgudeiiedthfehtdeffeekvdeffeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

All the drivers have long since been upgraded, and all the important
information here is also included in the "Implementing I2C device
drivers" guide.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 Documentation/i2c/upgrading-clients.rst | 285 ------------------------
 1 file changed, 285 deletions(-)
 delete mode 100644 Documentation/i2c/upgrading-clients.rst

diff --git a/Documentation/i2c/upgrading-clients.rst b/Documentation/i2c/upgrading-clients.rst
deleted file mode 100644
index 1708090d7b8f..000000000000
--- a/Documentation/i2c/upgrading-clients.rst
+++ /dev/null
@@ -1,285 +0,0 @@
-=================================================
-Upgrading I2C Drivers to the new 2.6 Driver Model
-=================================================
-
-Ben Dooks <ben-linux@fluff.org>
-
-Introduction
-------------
-
-This guide outlines how to alter existing Linux 2.6 client drivers from
-the old to the new binding methods.
-
-
-Example old-style driver
-------------------------
-
-::
-
-  struct example_state {
-	struct i2c_client	client;
-	....
-  };
-
-  static struct i2c_driver example_driver;
-
-  static unsigned short ignore[] = { I2C_CLIENT_END };
-  static unsigned short normal_addr[] = { OUR_ADDR, I2C_CLIENT_END };
-
-  I2C_CLIENT_INSMOD;
-
-  static int example_attach(struct i2c_adapter *adap, int addr, int kind)
-  {
-	struct example_state *state;
-	struct device *dev = &adap->dev;  /* to use for dev_ reports */
-	int ret;
-
-	state = kzalloc(sizeof(struct example_state), GFP_KERNEL);
-	if (state == NULL) {
-		dev_err(dev, "failed to create our state\n");
-		return -ENOMEM;
-	}
-
-	example->client.addr    = addr;
-	example->client.flags   = 0;
-	example->client.adapter = adap;
-
-	i2c_set_clientdata(&state->i2c_client, state);
-	strscpy(client->i2c_client.name, "example", sizeof(client->i2c_client.name));
-
-	ret = i2c_attach_client(&state->i2c_client);
-	if (ret < 0) {
-		dev_err(dev, "failed to attach client\n");
-		kfree(state);
-		return ret;
-	}
-
-	dev = &state->i2c_client.dev;
-
-	/* rest of the initialisation goes here. */
-
-	dev_info(dev, "example client created\n");
-
-	return 0;
-  }
-
-  static int example_detach(struct i2c_client *client)
-  {
-	struct example_state *state = i2c_get_clientdata(client);
-
-	i2c_detach_client(client);
-	kfree(state);
-	return 0;
-  }
-
-  static int example_attach_adapter(struct i2c_adapter *adap)
-  {
-	return i2c_probe(adap, &addr_data, example_attach);
-  }
-
-  static struct i2c_driver example_driver = {
-	.driver		= {
-		.owner		= THIS_MODULE,
-		.name		= "example",
-		.pm		= &example_pm_ops,
-	},
-	.attach_adapter = example_attach_adapter,
-	.detach_client	= example_detach,
-  };
-
-
-Updating the client
--------------------
-
-The new style binding model will check against a list of supported
-devices and their associated address supplied by the code registering
-the busses. This means that the driver .attach_adapter and
-.detach_client methods can be removed, along with the addr_data,
-as follows::
-
-  - static struct i2c_driver example_driver;
-
-  - static unsigned short ignore[] = { I2C_CLIENT_END };
-  - static unsigned short normal_addr[] = { OUR_ADDR, I2C_CLIENT_END };
-
-  - I2C_CLIENT_INSMOD;
-
-  - static int example_attach_adapter(struct i2c_adapter *adap)
-  - {
-  - 	return i2c_probe(adap, &addr_data, example_attach);
-  - }
-
-    static struct i2c_driver example_driver = {
-  -	.attach_adapter = example_attach_adapter,
-  -	.detach_client	= example_detach,
-    }
-
-Add the probe and remove methods to the i2c_driver, as so::
-
-   static struct i2c_driver example_driver = {
-  +	.probe		= example_probe,
-  +	.remove		= example_remove,
-   }
-
-Change the example_attach method to accept the new parameters
-which include the i2c_client that it will be working with::
-
-  - static int example_attach(struct i2c_adapter *adap, int addr, int kind)
-  + static int example_probe(struct i2c_client *client,
-  +			   const struct i2c_device_id *id)
-
-Change the name of example_attach to example_probe to align it with the
-i2c_driver entry names. The rest of the probe routine will now need to be
-changed as the i2c_client has already been setup for use.
-
-The necessary client fields have already been setup before
-the probe function is called, so the following client setup
-can be removed::
-
-  -	example->client.addr    = addr;
-  -	example->client.flags   = 0;
-  -	example->client.adapter = adap;
-  -
-  -	strscpy(client->i2c_client.name, "example", sizeof(client->i2c_client.name));
-
-The i2c_set_clientdata is now::
-
-  -	i2c_set_clientdata(&state->client, state);
-  +	i2c_set_clientdata(client, state);
-
-The call to i2c_attach_client is no longer needed, if the probe
-routine exits successfully, then the driver will be automatically
-attached by the core. Change the probe routine as so::
-
-  -	ret = i2c_attach_client(&state->i2c_client);
-  -	if (ret < 0) {
-  -		dev_err(dev, "failed to attach client\n");
-  -		kfree(state);
-  -		return ret;
-  -	}
-
-
-Remove the storage of 'struct i2c_client' from the 'struct example_state'
-as we are provided with the i2c_client in our example_probe. Instead we
-store a pointer to it for when it is needed.
-
-::
-
-  struct example_state {
-  -	struct i2c_client	client;
-  +	struct i2c_client	*client;
-
-the new i2c client as so::
-
-  -	struct device *dev = &adap->dev;  /* to use for dev_ reports */
-  + 	struct device *dev = &i2c_client->dev;  /* to use for dev_ reports */
-
-And remove the change after our client is attached, as the driver no
-longer needs to register a new client structure with the core::
-
-  -	dev = &state->i2c_client.dev;
-
-In the probe routine, ensure that the new state has the client stored
-in it::
-
-  static int example_probe(struct i2c_client *i2c_client,
-			 const struct i2c_device_id *id)
-  {
-	struct example_state *state;
-	struct device *dev = &i2c_client->dev;
-	int ret;
-
-	state = kzalloc(sizeof(struct example_state), GFP_KERNEL);
-	if (state == NULL) {
-		dev_err(dev, "failed to create our state\n");
-		return -ENOMEM;
-	}
-
-  +	state->client = i2c_client;
-
-Update the detach method, by changing the name to _remove and
-to delete the i2c_detach_client call. It is possible that you
-can also remove the ret variable as it is not needed for any
-of the core functions.
-
-::
-
-  - static int example_detach(struct i2c_client *client)
-  + static int example_remove(struct i2c_client *client)
-  {
-	struct example_state *state = i2c_get_clientdata(client);
-
-  -	i2c_detach_client(client);
-
-And finally ensure that we have the correct ID table for the i2c-core
-and other utilities::
-
-  + struct i2c_device_id example_idtable[] = {
-  +       { "example", 0 },
-  +       { }
-  +};
-  +
-  +MODULE_DEVICE_TABLE(i2c, example_idtable);
-
-  static struct i2c_driver example_driver = {
-	.driver		= {
-		.owner		= THIS_MODULE,
-		.name		= "example",
-	},
-  +	.id_table	= example_ids,
-
-
-Our driver should now look like this::
-
-  struct example_state {
-	struct i2c_client	*client;
-	....
-  };
-
-  static int example_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
-  {
-	struct example_state *state;
-	struct device *dev = &client->dev;
-
-	state = kzalloc(sizeof(struct example_state), GFP_KERNEL);
-	if (state == NULL) {
-		dev_err(dev, "failed to create our state\n");
-		return -ENOMEM;
-	}
-
-	state->client = client;
-	i2c_set_clientdata(client, state);
-
-	/* rest of the initialisation goes here. */
-
-	dev_info(dev, "example client created\n");
-
-	return 0;
-  }
-
-  static int example_remove(struct i2c_client *client)
-  {
-	struct example_state *state = i2c_get_clientdata(client);
-
-	kfree(state);
-	return 0;
-  }
-
-  static struct i2c_device_id example_idtable[] = {
-	{ "example", 0 },
-	{ }
-  };
-
-  MODULE_DEVICE_TABLE(i2c, example_idtable);
-
-  static struct i2c_driver example_driver = {
-	.driver		= {
-		.owner		= THIS_MODULE,
-		.name		= "example",
-		.pm		= &example_pm_ops,
-	},
-	.id_table	= example_idtable,
-	.probe		= example_probe,
-	.remove		= example_remove,
-  };

base-commit: 2324d50d051ec0f14a548e78554fb02513d6dcef
-- 
2.20.1

