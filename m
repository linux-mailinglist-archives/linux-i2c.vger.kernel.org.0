Return-Path: <linux-i2c+bounces-13071-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AF0B8F1C2
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 08:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A713178E8D
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 06:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1BF2EF662;
	Mon, 22 Sep 2025 06:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVx8cdA0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAAA2C375A
	for <linux-i2c@vger.kernel.org>; Mon, 22 Sep 2025 06:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758522108; cv=none; b=B74U3j0y8juNsZLrwAGHKkum9M+zMmyY0Hst7dBcAj7RViSbHPELulTk5/hOo1RF1Iuf3nv0JA8BsM4iDUh3b/lYwKec7PUkd18pbTbMwaSwDzikTtsTR2Mc6MjMz8CMm+qX+XHsvQ8rhYva2GDoE8MP/8SUm4UAf6svhxB80hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758522108; c=relaxed/simple;
	bh=UBc7AM0gSO9uZhPLncPbz9SMwH2LrhqeMCqUzN/cGpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sZGQ42nv08g4JiXlkyRCNBSCEmLahXWfbMaso7X2P4gUIjYBpLRZPhviasfeQEn1xK90Ac8Gc0NsQfHUzPZNnNmCXxPWQ0B2lykLrDeZHTniEeW17RPiHnRBbKmdFr+Ei8mhle4ntyjeLN9Z7s5ZDMDoSmc81B9ncH8dbe4dgGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVx8cdA0; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-36295d53a10so31574081fa.0
        for <linux-i2c@vger.kernel.org>; Sun, 21 Sep 2025 23:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758522105; x=1759126905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tflbFhpYb7LhX1EKPWzM1vNL9oW2j1u/K47rwyVr7HA=;
        b=QVx8cdA0HwrUcN42Q63iNqTCLOXRjyhMpsAtucHoabu8rOdLScRMzVXEYyFSg/KDme
         aBCzG7HnWbm52jF6gKgPMwPctyPicBpKkQexMKISZUqn7WAEUKy/Bx3LYoi0iO72Ivf1
         tvO3hQijRTpvKYO8wSwvUimJUolJO6CoiG6E5T/Y6KuSpnzLD+ADnqkNaVK+rmqatMuG
         10Yf0bh+z1qoOIE+eZ/Sizt3a357t/SFykz2qXYjyRfcJBLmHK51oR4u017bl7u3NEZz
         xK0Pn0wYOsR6fwe3nBHi53wdGXv3GtTEFTocWhgNqY6Fzi6I+2miX0k5hPvLoFi4wB1K
         Ylmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758522105; x=1759126905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tflbFhpYb7LhX1EKPWzM1vNL9oW2j1u/K47rwyVr7HA=;
        b=IbZpPH5UXmtywoF/C/6wTlIzq+A1OJb5KEqQ3Odh3ZQn7+1dEnJUnOsGPh1NwbloXe
         IpXKJKlrhBbEu/sJBV4qrvoyydPLFgC5v6TULWQj0h78TReOaK+2jqSLIPJ50LaFfZx7
         ciMeWmLz3Ot7xatWfTEkxazUgTVjAt7EDCoq0w+iYYBFXA5NlQBTCgm32xOyoT3V6Y3Y
         ZE1qS8eu+ZTsnJ72MKvlBaPDR5dYxTK2HUDf+6NfTttRIWmc4wJ6y5cmATBcHLkCLLYq
         HxSfXTAzrMbKc57bIdwLrrtQf4EWO5fXldcgDptb7g1jft7xNwJCQNK9fxRTPKKoEunn
         FhXA==
X-Gm-Message-State: AOJu0YyVC+L47ulqwA9e/TLONC/hJY/zWoyPkZUpUFsVFXK7zRDccEW2
	LJpgLmfWf6MJsG+gUmWGft5zPCtgS234ON3ORSGKlavKHBPLnu7ppAp5
X-Gm-Gg: ASbGncsnBaQ9j2U6hX2UoYzZWm2UDzbFZ+hJ/GNicmpjCUR2obn+sOG/UYOC88fs6Lq
	yoWCEFxnVmqu4eKyS4nBrvpMTUF+eRDmMJ3JrOpTW8yUIohzHog8E4k5ZCXJ+9QWz1VUCVqoLDY
	bj56J+tTm6cg1rqglrhHQiT2pjN9k3ZkclA40t4Kp6QqiqkYk2x1ynVGzc4vjlGSsuTEaZuxB8P
	7yyazxDRSbOzHqPLumsQM4Gv70qHXgd+vlgRymeSuK+Xmq3588i/vKb7wSRoUMEv+sMCmxZg0el
	X57XZNozoOzzSRojstrNLqT2btgNKR09hJ3YYgrPFsQ1QUBhLYClg1fyVLudWo71IObIBP11rLv
	qFjyiFbsiuBpbCE007jE3N5JJAQbBfRffkmWGTnsvNQ2XqysGl9jIHTjeVXhI/B2qSRE=
X-Google-Smtp-Source: AGHT+IGAP/9qoDwVGCmbbFJydkjjc+ZyIXD+1vfex4mQA579RdyZw8D0MQranCYlakKK9Oih5XxNiQ==
X-Received: by 2002:a2e:a553:0:b0:36b:7167:5616 with SMTP id 38308e7fff4ca-36b71675bc4mr6929961fa.36.1758522104533;
        Sun, 21 Sep 2025 23:21:44 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a99e99e6sm26982661fa.56.2025.09.21.23.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 23:21:43 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 22 Sep 2025 08:20:58 +0200
Subject: [PATCH RFC 3/7] i2c: mux: add support for per channel bus
 frequency
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-i2c-mux-v1-3-28c94a610930@gmail.com>
References: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
In-Reply-To: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7882;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=UBc7AM0gSO9uZhPLncPbz9SMwH2LrhqeMCqUzN/cGpE=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo0OrY/VgoJ03b/XE53W/Fnnp6hsxPEZWuFyY6f
 vBnSPuSdf6JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaNDq2AAKCRCIgE5vWV1S
 MrkmD/9WfPS3fCHXOXE4yGJNyYvFXKN9UpVrhDhni7B6ty7jOOKH85wVttq4AMIyfLo6qIU2NOo
 jaq7UDZRrjT5KdEb5rECLnqXWVhRgv81m5zXHJFlIoz4+HMeMlZ9SuAaOXI+OVT4kckpZ6Ma1Ee
 cfRKdMuhEY94TOROSzvRWXrI+bwbVLPpBjeI3ue1wrOEPGbbfBwnduUdA+/xsrOJlcNSrxeCdal
 9IXeUHKW6eyIQX2j8qA2So3LIF6/GzPNMxdifLaIu4x8j7lStkuRvzhIR1BuKdPJ8WMMgevEmkZ
 cHX0oEx30f4GqPHyxwqbhFRDgYtQSjfP4bygPkNRKGT29Ar/1wVpHFDl+daCTC59sorkguQ3RdY
 npO6dYo2POofexUJyMkLRFYI9VWTQQJOWxJgsFt0XSaaBRYE+/mkAWqfbE3AxmKqSXqGwf9SjnW
 W0Ygrfc07saUkVWZYRkJIgKMbs82ROnB9UcBOXc8MGjXZe9vnunvlnzfk3jwHSQM9ymwNmJqrDL
 kvXmTZDFjZ+i3xQQn8gFTWO1HcfBnrIRn1T+gQ48LNlAsbiiaJ1V+mcLsM0iKZQ6pSKB5yecx/N
 1rdHH8xi/HtxRIMXJr4wWowsF9S8KKCFDPWXCapkyxXsfLsrqdUhk9eJtvx4ApVHaNE6h6hu1Ao
 7DlYHhMUf6Dil4g==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

There could be several reasons why you may need to use a certain speed
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
 drivers/i2c/i2c-mux.c | 126 +++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 114 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 5caa927c0caae512af029f0d1ae9b7f845ba3f6f..22b404597ff91eddb965c48112fdc63250d71e43 100644
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
@@ -366,6 +432,42 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 			}
 		}
 
+		of_property_read_u32(child, "clock-frequency", &priv->adap.clock_hz);
+
+		/*
+		 * Warn if the mux adapter does not disconnect channels or
+		 * if a low-speed channel is seleced during idle.
+		 */
+		if (priv->adap.clock_hz < parent->clock_hz)
+			if (muxc->idle_state != MUX_IDLE_DISCONNECT ||
+			    muxc->idle_state == chan_id)
+				dev_warn(muxc->dev,
+					 "channel %u has improper idle state for this configuration\n",
+					 chan_id);
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
+				"channel (%u) is faster than parent (%u)\n",
+				chan_id, priv->adap.clock_hz, parent->clock_hz);
+
+			of_node_put(mux_node);
+			goto err_free_priv;
+		}
+
 		priv->adap.dev.of_node = child;
 		of_node_put(mux_node);
 	}

-- 
2.50.1


