Return-Path: <linux-i2c+bounces-13659-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA52BEFA64
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 09:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 807224EF9CE
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 07:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D612DC780;
	Mon, 20 Oct 2025 07:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+0jwSj/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7612DA775
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 07:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760944683; cv=none; b=UHQYsjeXw0Diyxphs4dDUWoeSgdMBveZ4K+gkSfVGyg2pzUoYakYwKxBSgl01uZKUfg3DOEwtheBYNXkqrYjaqtqxPx9IRCj6L9DKX3xaBBHn7fDftvIrIn1z+WPHrrNaiYH5bXBTm97mBxO/YCLlVSNfNpm1mvFtqOLYei7Yxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760944683; c=relaxed/simple;
	bh=/iS9Z/pm4g1MBRBvX3jA56ZzUhOrp48L5lgjzmLwrLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mAih+VQ/SKzihf00yF2aTvP5VT8OmGzSU8f9vxCUyLx5S/A4nLd08fFSgVpjgwtsmC1vWh9XtiTlaCbpSXdq6XYjmHAoqqZ89xmfQKIWPzQOm0XNr8eV3xH+mLsELlic9Lz5sPx7ywj8XtlgSKTd1IlbN8RqfxDfWnUewQSvCzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+0jwSj/; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57e8e67aa3eso6607636e87.1
        for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 00:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760944679; x=1761549479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hltXMUlkzirB7nFSN76+e+DFNg+q24PFFqRwJUD70Q=;
        b=K+0jwSj/CVUieycZdA4gU6R5fipH7rKGnlQtKohzZR08orm23DOdBBR9LYLaVkXpOF
         oNrSfUV8bjmRATbPh4mUeduR7/00B+CfsnCD35i5n0F4NwOmTDRGEUniybKGpoIEQD1g
         4NHkRV7xjBgfMu9Frw//aG6+CkB2t0ojyUGOgVCHubRW02HHcGqGq/sPUCbPTkdF33Q/
         of6vXrd508KjovnKVirOAOBXVUmo1Jfk0iJbtPi3KLYRJF80NmbJHRGHP2qnqfqHgEX1
         /AcVKNGM+389VJvuG3bT/ohtTU+N64FJ47OlrMsuKX+2/rtA8413w4Bgp7MviEF5jT0Z
         GSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760944679; x=1761549479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hltXMUlkzirB7nFSN76+e+DFNg+q24PFFqRwJUD70Q=;
        b=Y6gf98pwVO4dY9TAb+AEdXNHvp3s6uokB8FMXw+nfhe1SPYlrUeW+j7N2lZuvDQfAO
         NSY4j+BuUGvq5a0OT5IjH6sfkmZMpiHGsGiC3pACfM8giiX8XilvsKqTaYHmMnf1trUv
         UP5kcwHPYLxnBrwskQVR5alXJFobnhDxvU3bRYiPBfVzBHYT8lh2WD7QL2G9MxHJ4aqy
         VZCBCEeSfA1g9GIaRmIB2emGS59JuvaEYoCxGcKumDRE4JQS3fpzMbLnDkSVTPJU8HEv
         J/4Dpm2j1HD3Lbzp8Y4YqQeHhE8PfsrS4IkgfNMaXMcfjuLa5nwhW+MdAX+WGth4vEaB
         FagQ==
X-Gm-Message-State: AOJu0YywK6IWKJIYrcDp+X/x4qIB899HfEjQ0kubosB77TPrUZ9oPxKF
	USCnTYtfnkKyG8+VrkBLYy47DjKJ2EmomPC/8aOOvHL4LdY/xcUNuWbu
X-Gm-Gg: ASbGncsKkFF5yYy3zVGllcO3Kmi27iXXijKoZYqKJqcQy4iuoaNUN4G4+1QKeQeZoc1
	0L1o9E3vy65BtoedwfLXm8/GBDon7cIQCwOPV0edq0/DPuu4Rq4Qwlr2Dd/Wg90xk1plOw7jsdf
	MQ0W0ebkyUmK7tiS7Xi0A7dbDfVHeYiVkZpgaCBWE7y2AgED11GwkSqaxjSDLj8WT3bc0GmY4S8
	N6/hoIXJU6xP12WN5rnwnKi0vgQ4kUXXNKo04Sicto+hYJX0bSH0Eofb5vK3GUHeuktZR+Gb0sh
	rtPQg91AuKP7oxOeKp4z82p8/HGQn9dR8kFW3JPxh1zkuocjaOYsN/0KlWrgO9tMEXPBRWLNGU1
	+KaBne5PIsisywxGpBNq/KWSObVetVEphLFnzodQjKdehDFErDA+8VE1JUNTCpNBGYg5v18aQGS
	jgVyKv8eZXPQYq04A1Nq55IFZJ8WQtEm7ERbjnjtdzwMMrcBUD8BAINSY=
X-Google-Smtp-Source: AGHT+IFOSjHzTf5ZFSeasdKYfpp5nWUGM93vqKy15Ur2zTONCZTgOd3fOAO7IQLpuPX2GBKwktXROg==
X-Received: by 2002:a05:651c:1608:b0:36b:ee68:b022 with SMTP id 38308e7fff4ca-37797732121mr38865791fa.4.1760944679264;
        Mon, 20 Oct 2025 00:17:59 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a921ae62sm18863341fa.21.2025.10.20.00.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:17:58 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 20 Oct 2025 09:17:25 +0200
Subject: [PATCH v3 2/5] i2c: mux: add support for per channel bus frequency
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-i2c-mux-v3-2-908ac5cf9223@gmail.com>
References: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
In-Reply-To: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7517;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=/iS9Z/pm4g1MBRBvX3jA56ZzUhOrp48L5lgjzmLwrLc=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo9eIONuOu9MR9C01xqdAkdsU2YF0UumOJnisww
 xPainNZtPOJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaPXiDgAKCRCIgE5vWV1S
 Mn32EACqdMDBYVOF0BCZ8ACrLGJ6qmLQFWSX0rPDx9CeQbzxnNNW2QbkS9HY9O0h8WaZGx3we1i
 sow6pCp8/1o0vkiwPSga/oaTY/kWsg2jX2RQfDS2LqnpSMIRmPCAV/qOAWUlj6/txmC6q7wolbu
 FkHECeEkhcQzkiFEQgBzHbZWHAW1OZjdZK0JENwxpWbkoV4MGhT7+PJHOV62KbX3MEiEmkBT3V7
 XY1tvk0v25IPEAgG6vRtsRU37j/rE0nZIMlzmWPQzN81JiLIUq+Rc9sVWADtLejAXy56c/y6CDd
 00jtKU+zZQNAw9EtooSKKvw0QWkOO+bl/DTIslG4MWzv2nACaMEvZ5zSTomzo2gWF9Is1eJNLIO
 GDxjxDe+lB3+/dPfJTbcokQPxZr4ycLqZm/VxqGhu9kr4iF/CDDXkY6d8fCR6udsc3Wb6zdK0jt
 ZlOS35/THU8eeubnx/mrZGcNlROQDnyCcFT6yK7ajdki64Sf/eUWBcXpb15dxkawh7QbQyOaDnG
 WhikllJThAu2i1QJlOi9J8kH9HfYWOFpTNhogRf0hvzULAuNBEweu8b+UooFRUdeCD7qCXeB0BJ
 cYkopOvnDpCv1UQrc77xxXVnh1ruZMXJUY3uJiET+m+UPyyFOiXrK4tZwFYdySR4e5QjAZEMsQI
 j7H431bMcOM5Frg==
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
index 4d8690981a55dc0e1b35454971923791e6ed9f7f..67ba33a13dde42335ba4e289afdccb2419b6e4ae 100644
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
2.50.1


