Return-Path: <linux-i2c+bounces-13357-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC45DBB4325
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 16:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A43AD19E13DB
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 14:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9DD31326A;
	Thu,  2 Oct 2025 14:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjoucSJf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D64312821
	for <linux-i2c@vger.kernel.org>; Thu,  2 Oct 2025 14:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759416138; cv=none; b=iNoRafRdkJ5Bkif9P1AxJX/e8OhPYRFW2YWmrc4dQ+iHxrLFfpFoEsfVzNs7M4bKL2I2yig3iPbKNujcPX8gZT4KwuYNoSLld3MttG6IJu9RgoyvxxfcXp/pj0lg7NkjUSxBGbzZtf9wXS4PJKdATZgdA+Ua4tjEYbQi6Ki9a+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759416138; c=relaxed/simple;
	bh=CnKS7KgVbqNJeBUIwvWBcCBehV2jOZtzW9PNcQI/CnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G+O+Hm6M8lQ91gGEfl0jd7BFqj6fIgqWtVqpiV/yjv4XkE0VUow4LADE8l2MwxB+lFF2i7p2xiY2ltFqRBa8ANuHCQvL9J2JBMX4EPVumwb193Fr9XWTdaWnSEpNuq4XhSPhHsBZ6NWk3gQlLrrxSHjKo2UdBxgKAzc6mnnjDfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjoucSJf; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57d8ff3944dso1298407e87.3
        for <linux-i2c@vger.kernel.org>; Thu, 02 Oct 2025 07:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759416134; x=1760020934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZfyuHu7f2fQho6DT6kcnt03GbK0UWs35JdS1BwwuDZw=;
        b=mjoucSJfxVYBIBJiNltjoPvR6oRPN0vrQPXCxx0zXb3rmRhJFxBn4FOd0vItTCZMIJ
         mQxF/fSpSwuaGjphPZvX7ZndJONVWjZVvbxb/176bbtvCRKqvhR3PbyIrRW2Xl9Nhkkv
         Zksyka4Yq2gofb292ULE8gorSUmjHZiHB+tQ1XfUpqDMvLuwJimbly/+tgh1VmMsTDeW
         /Y7sxP2kx6flAjGe4kMzQ5oQpAdypVkJVXJZuUu+G22gNlkFTNuzp53V+tYWM0YJ9hXf
         P67ugVRtBBLrcqZ1NsIgXcS9EkplxE8GCXOH9xQlgpZt5G9lChfj9flIUvEagbWR3CwJ
         W3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759416134; x=1760020934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfyuHu7f2fQho6DT6kcnt03GbK0UWs35JdS1BwwuDZw=;
        b=jtuoWNHhoOu61EmNuhqT+kunbRW0cYb2Yah121XrTALM73Nvj9on0KV52mMImuwuHc
         m/IAj7FIXVSGfHZO0faiElwqDJC962XoX/08MifySnkeVS6+6Fyyte2htHPnvAVU/Uzl
         fzc1T5EQBg+doYx155QgdH2MPqwGx7bdYnJhDsre/CU9BdE0RFgHI5JHc0VyKXtEMC2s
         bu8PAAYkgnKuB1HDuBR+XTWWsBhT7iej/4NBC7QR/3KL/2PTrBXUKSbDSeSdcVQhiuOk
         T/caj/hZqEWwa9BTqWNAgACYNq2ZdW3CEocsDnDqB7bW5z873ovkzwZX3SUyk9suR6s4
         XFkA==
X-Gm-Message-State: AOJu0YyG/JjB9vToTbLVZ2z1/NXshgmlTL2EFJIa3prYH2Zk3FhF50V8
	Rw796ZGuKwsrUSEPpYF3Foh07uySvqW9piNpKjC830IxoMiH9hI/EGCO6WrgMMSiyEk=
X-Gm-Gg: ASbGncui+gYsH87bZ9hY7fQxk/99WKFOwoV3odV7wuSh6cgahmjkzcTVx5StjvFtrUD
	IBmadxBVvDJY/VsWsXQ5PnrfT/hM05UXFqR4gCurXFS6N1ZzY6DQDE1KDtiszBEcIB4y4+LIJ56
	OhxFtQeXPL6Jj7U84VPNgq7C2GOH+XtrOGw4lVPUbxq1spEb0K3vB8FYgaVXe8QmLY4bFCXcnWs
	fhjzhRi8EZ2hR6YCrmx0epb2a2uq5zO8tppDcrBYzO/7DYxv6v1DJr4OGoj0sYSt25TTrbQMbtU
	kJAVNxY/hJs98Icljj/9gVAIDOYhRBbiMlhzj6n5xFu72ugFITQucqo3ue7M0Gv9dCLvvwYEles
	j6/B53IKfBnqLWvbCOMsqXj1IWXTCfpmPcypY307ShTU3fKT/V+VFYdBR+6n5MlfF1G5Wq40gr+
	45pNut7ccbU+ylyvw=
X-Google-Smtp-Source: AGHT+IHvlF2spZ+hnhw5AwvVnmf222TFfcTBJgdlsu4qB7yk4mCTPKnFgGpIgM5bjJFAbuhn7c4yJg==
X-Received: by 2002:a05:6512:3994:b0:586:83e2:228a with SMTP id 2adb3069b0e04-58af9f4a92fmr2258097e87.45.1759416133957;
        Thu, 02 Oct 2025 07:42:13 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119e60fsm884712e87.94.2025.10.02.07.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 07:42:13 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 02 Oct 2025 16:41:33 +0200
Subject: [PATCH v2 2/5] i2c: mux: add support for per channel bus frequency
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-i2c-mux-v2-2-b698564cd956@gmail.com>
References: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
In-Reply-To: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7497;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=CnKS7KgVbqNJeBUIwvWBcCBehV2jOZtzW9PNcQI/CnE=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo3o8uMaRwZa8DTWs5SZOYWDcoIZ4pXHFz+5S3P
 ue9nMSTMCaJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaN6PLgAKCRCIgE5vWV1S
 MspED/4gVppfP67fZfYX4b17MuAi36CT5f+G15I8IWwI11Mh48RloIeylQQvVa7JL1KMEAx34ZE
 WIboQKCSMIHQc3wMNvODVCe3adi2Lfhmrxwed7hFmT21xlEeRu2KLXtdBeByxUYOZDLiKUHDsHT
 WJHxvJcilPDBEN+ibki695c/SQkshy7xvuNsA7FOY7Ci2Tpc5+Qfyyqr0qaqpQ89sPLn8Zv8EoS
 2TgzMOJfMBndWxmPTKlY9uMT9keD2p+fYgZ6xVNc3ZJuvXWbtdOKh5ePuLQiWWlrmccO+M2kqEM
 nXvJqCGFQq+qMjv3msXfDOPM7LKK7XdiM38PPzDRs3sntxL5KsqOa4Nmu35fBMftpyJGEILvwMl
 2r9c7yTlb7SpwrFTAb6YDvvK5CW8MMZP+hTWqr10T1Fz9IxTi1Y8FIuhqs4Y++pFRJ6Kfcm7Wql
 jVWxZhhUTQL0RWj0f+vhE67FUi3ZjaaXA+yqYRzCgC9LCZKEIScdyVwUqwFuXs1ids4WEbjJxMH
 dyRnr86y2xAPil7VJVBanvftkG5R6N6PBI9dkaDcvx6Ut9tcy7tQJK8Q4U+Cx6TT70JpJvqA2nU
 RgFqAPLNuqvuH3HWAaILH1bB9lVsp+dtY9YJD5XhBZ5iXCvOgofuvzXCGFCA/TYFuBlzNOPBa1H
 QSy5WB2sm2+k/Fg==
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
 drivers/i2c/i2c-mux.c | 115 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 103 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 4d8690981a55dc0e1b35454971923791e6ed9f7f..5987853afa75cb58e1c6af6c7e7d52873ea53507 100644
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
@@ -365,6 +431,31 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
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
+			goto err_free_priv;
+		}
+
 		priv->adap.dev.of_node = child;
 		of_node_put(mux_node);
 	}

-- 
2.50.1


