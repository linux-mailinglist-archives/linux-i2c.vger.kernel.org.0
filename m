Return-Path: <linux-i2c+bounces-14108-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6464CC630C9
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 10:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DF00435E2D2
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 09:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3970C32827C;
	Mon, 17 Nov 2025 09:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNQRwmeH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28E3327206
	for <linux-i2c@vger.kernel.org>; Mon, 17 Nov 2025 09:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763370341; cv=none; b=FI2qjjCezOG61SiVy+pk6aelfryz8YryoJxGUdyXGg38E/XB0NHDAjkIIdJUTkO5BwfPCNCJoPDcWPTFXFEQZsvLx9NxijABS3VhTq1SaJuAKji6t4pfHuXiWLSfr0F0PW7dyW/M6+gXJDuxlkCk3qhG7Vq4g6uPhXbDai2wd1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763370341; c=relaxed/simple;
	bh=o4Zt8X+zyI6wUYVNms/IgvHSL1cE9RhNZwSvJA7JohU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cRnuc6AqMODtaejcXaPTXCan8QGfPsEVy+cucZ3PKuhyDBhnYMMoIl19zVi3XHkKxgIOtvalkdrYarPPlrysHI8/JO4jlO5G5JGP5mVSDoWOV2gnChp5UqIPRQxbCYHGECnbi05NuqyEp5K+x8L9xbZ+uYA6T3SsZ/pBuE+Wz3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNQRwmeH; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59582673e15so3148890e87.3
        for <linux-i2c@vger.kernel.org>; Mon, 17 Nov 2025 01:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763370338; x=1763975138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Isv7N56R7GLLyxOJRI4a7jcx/LSO3hI5hjNg+m1oWY=;
        b=lNQRwmeHoBS001gEXYZjAMn9ept6SgFLXyMf8NQTvr20ZqXbBnFEOuWC6jxOQ1f6aM
         eZ51ujJRILZkPacpoMPReyy7LpVZeOd1xRwqHOPmVwNOqkn8bVRt+Ksi+pMS7YeH694a
         ZoX9z2jMbBXR1L4SDKqmKS5JCAUYjqZAh743MXKpJI1xDBVVcxNIu1gz691FGdb02HEZ
         qFlepIIdQt4O9A03QoiHyhNBWFnH0JjTigxT5ff11M4neLe2sijBs+YI+1i8HDnwrvMm
         HmCwPrZ9Y5z+Sm4gG10Z+rGslnUXtLZfJ2OFdUHwaqzzBi7IKEIM65DjG/AygwZbttGN
         HrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370338; x=1763975138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Isv7N56R7GLLyxOJRI4a7jcx/LSO3hI5hjNg+m1oWY=;
        b=my0HySiOYLamWeTv2p06noJtHF2InPSImMbE3Ozr+4mH73sR/GPtRq/wg5W3jH5ZAQ
         HWEsWQO4vPQIABgS2TaQA8M9+3msxCbXIkS8f9udgrrdJoFc396pq0YmjyZ6X3SYtf9Y
         /CJ0dEtcVVgyk0M86/+bMthanTHpUb+6mePKu7I9xFe2ROSXkMpb5ylebg8ztsitOI/y
         J5sORaEbgxZsbaXQmhv8QZWG93YNVfrBMpDz7vA0zGJasp2j7bEpVpbtwlp0ICIhBhrc
         wt9iGRA/mJWT4e0iQh2gjf+swDaLPpbY4bVmGSQ4EAPiX7OnMKPnQnjX5CNMr96tKSPy
         /6sg==
X-Gm-Message-State: AOJu0YwMMLiOi2W+IxtEgJ8xZZ04kgDL19p3erPvigsKqIWib1y+pMvg
	LPCxX6+APKy6oFvP3RG3qk2EWXJL+EITEqWkJV6PaNtt4TfmmwpC4caJ
X-Gm-Gg: ASbGncs8rZCvjW+cw6TQzPxCKXQX6HYgrk454sKdysgRLfFz/W0zi8a0y2X6rbsMWvL
	A5taZ6JTWBixjqpivxCjQ3cPZ/BcZVPl+yyEQM9qdG92KfTLSKg2xpiXsL/l1QQPgk+xE6PdN2x
	lSEo7/ugZCDv9kZ87cPlOXSIrt1r/ZvlWQItOVXaUnEARqSfVbw3M2AyIlcl90uFvfkCnh+mflH
	Mi+Vh4gKWID+B6k5f7eVPeniM0stDtThmKd3fpQr+NUeri87yk+qBDjJEvkpj07WsQXhz2jbN2H
	0X0NqzZjqgUuR5td8LpUbKcW4DTl/5KccoTiDxDkJHZR5WiDWqP4pkG6fcwZjM38jAL3+j+S19y
	sg4h4thyzh15K8A1raLMWYA+y4QR7YoAcp+SjQnb8ZCIUMm+JhwanFiu49CJa41hwHl/qzKqH2e
	11IL9GzxRlL8vLJyEkur81u4aCNjvm7JWDSzoklMDMfFdHIYlB3eKoowKo
X-Google-Smtp-Source: AGHT+IFq3bjLXgXR/l8QI5stld2SKVhIi0p87VE5kMCDBF+BlgvJCbu8ZfTkjkZ+90HinEcjUZaNbA==
X-Received: by 2002:a05:6512:3b9f:b0:594:4b7f:f946 with SMTP id 2adb3069b0e04-595841f981emr4477997e87.33.1763370337911;
        Mon, 17 Nov 2025 01:05:37 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405693sm3023727e87.76.2025.11.17.01.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:05:36 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 17 Nov 2025 10:04:59 +0100
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
Message-Id: <20251117-i2c-mux-v3-2-696c83e3505a@gmail.com>
References: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
In-Reply-To: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
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
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpGuVKENJzVneUYEFrwizPAt/EAZgk8ypOAZ42j
 uXyyfqJ9DeJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaRrlSgAKCRCIgE5vWV1S
 MpIMD/0fxUebzVqxVVOGqSGh8svawNypcAjs9Vr7oeAwSxK6XVUDHoPmWgE5VNm1JHyC6cPIPhP
 huRtbhxKUIF+n9UoHGbeXPrR5oR+KWXbzofEs+OfY3tFS0ITmkBOkvHoVGwn502PObbn3b+q+/b
 8Le+qjwaAh9y0Th+Kt69iLQ+NDSmP7Idt1Nr8JWPek0PRAXBVlJbxwIlHS6OYcO8a+HgrkHcqYi
 FDRLrwJnXYJZBFgsKR6Ujrl2l5yojDL+IQiTHpAQOXRvmo9cYHSJGgN5QH4mqb96xjsFnaNoldc
 ly6R7Ep5l6Klzrfnj5EdPXJUMvGOda22jBcZ31u368R60Zbxchune5kfw82d1ai5jwEtIuEMUx5
 vGQqLpWKxjj2zSiRnRO8jzekfBCucrzhFQoTHx1AkC1zBLxDK3w8DvSlHP6vDNUs+VtxCKJUL0m
 dzPdcgsaKm4ltmQPw+E9eDDid6dLG6vQBk3k8obC13ksvnAdOXPrOFYUHbFmRNIEFOn8ecpe1xg
 73VY7CmzZx6d1Vgo7fprBuia3W0953PUbnZ30iDSDeB7wV+PDR80L7RerYjayywC9fXehxbx4nt
 fDLvlj9mzn+nfbgoRdlLgqNFpRNtwzwj0Qq7RMibSRuwY3pMGT+kuIzXOjNDIh7wBeP2sCyiuXE
 DYxno5+lE/DABLQ==
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


