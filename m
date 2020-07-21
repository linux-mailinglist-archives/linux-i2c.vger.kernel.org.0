Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4749F227937
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jul 2020 09:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgGUHH6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jul 2020 03:07:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbgGUHH6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jul 2020 03:07:58 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9287C061794
        for <linux-i2c@vger.kernel.org>; Tue, 21 Jul 2020 00:07:57 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id d1so9863260plr.8
        for <linux-i2c@vger.kernel.org>; Tue, 21 Jul 2020 00:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=qNbP3GH6FTHcY3EHBVOIDKqHf3ksRmc9Xvn4bjioF6U=;
        b=GwKICDMAnNPbenAoBx53YsjMJoILBLCL2sj8u/ZXHF1oiqZsJTjgLDpD7hSUAV+nC+
         hZczzxNtxWm/3IudM+aVvzLqKKExExg8jKxF5r8g3EDW1Opf7qM1BXeS2Vqf71i7/SCh
         z89592eIfnRSOdDPsG/tVCnRFkEAbcxtexyhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=qNbP3GH6FTHcY3EHBVOIDKqHf3ksRmc9Xvn4bjioF6U=;
        b=DR9Px8WCg6rSvlAX5zYfVvR2EcDNG3fyLP9L6Qy86a8Gq1zXGhBVYjr2hllGWObOT4
         ytVt6+/PC5PgcGUaEs3plS7rcUwb7sgbeoluf7nOJBf4CwnhTox3+yET2vRz5ZM2qwjr
         zJQn6RSoKydJK1P5nAYsChwplYo4QrDTVnxNWz15EwkdRRtNHrJJxPRxeOyboFkD+aUg
         7KDm8zsJuZB3lUFmdULddYGWpCCnBHKYGJt4cnfNfMjDInQ+o/srTYAAQEyI4kvBAdGF
         X1OWaqgpMqtPriD0EQFq/ZZY0cXqOGYaNcchfo/GzutV6wjFIlPZg3TD80zymublCZqc
         EhoQ==
X-Gm-Message-State: AOAM5329/p3OGrrXVpvDHflcbiLlpI6ybR0FZa+TgmcGrZYFKWeHOI1A
        IJ4kv8uBWLWmxvA63F7lEOpBJA==
X-Google-Smtp-Source: ABdhPJw/kwAm7oVfcWNNuqIonh+k0jg5j1LBksAb0CBNg8oJfyuEE62mrsxpx3JqbP404pSKa+mY8w==
X-Received: by 2002:a17:90a:cf:: with SMTP id v15mr3180612pjd.14.1595315277393;
        Tue, 21 Jul 2020 00:07:57 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id v28sm17924472pgn.81.2020.07.21.00.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 00:07:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <159531115483.3847286.18280088484118119899@swboyd.mtv.corp.google.com>
References: <20200720172448.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid> <159531115483.3847286.18280088484118119899@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] i2c: i2c-qcom-geni: Fix DMA transfer race
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Wolfram Sang <wsa@the-dreams.de>
Date:   Tue, 21 Jul 2020 00:07:55 -0700
Message-ID: <159531527579.3847286.1254956818647049462@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Stephen Boyd (2020-07-20 22:59:14)
>=20
> I worry that we also need a dmb() here to make sure the dma buffer is
> properly mapped before this write to the device is attempted. But it may
> only matter to be before the I2C_READ.
>=20

I'm suggesting this patch instead where we make geni_se_setup_m_cmd()
use a writel() so that it has the proper barrier semantics to wait for
the other memory writes that happened in program order before this point
to complete before the device is kicked to do a read or a write.

----8<----
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qc=
om-geni.c
index 18d1e4fd4cf3..7f130829bf01 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -367,7 +367,6 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2=
c, struct i2c_msg *msg,
 		geni_se_select_mode(se, GENI_SE_FIFO);
=20
 	writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
-	geni_se_setup_m_cmd(se, I2C_READ, m_param);
=20
 	if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &rx_dma)) {
 		geni_se_select_mode(se, GENI_SE_FIFO);
@@ -375,6 +374,8 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2=
c, struct i2c_msg *msg,
 		dma_buf =3D NULL;
 	}
=20
+	geni_se_setup_m_cmd(se, I2C_READ, m_param);
+
 	time_left =3D wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
 	if (!time_left)
 		geni_i2c_abort_xfer(gi2c);
@@ -408,7 +409,6 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2=
c, struct i2c_msg *msg,
 		geni_se_select_mode(se, GENI_SE_FIFO);
=20
 	writel_relaxed(len, se->base + SE_I2C_TX_TRANS_LEN);
-	geni_se_setup_m_cmd(se, I2C_WRITE, m_param);
=20
 	if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, len, &tx_dma)) {
 		geni_se_select_mode(se, GENI_SE_FIFO);
@@ -416,6 +416,8 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2=
c, struct i2c_msg *msg,
 		dma_buf =3D NULL;
 	}
=20
+	geni_se_setup_m_cmd(se, I2C_WRITE, m_param);
+
 	if (!dma_buf) /* Get FIFO IRQ */
 		writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
=20
diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index dd464943f717..1dc134e9eb36 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -262,7 +262,7 @@ static inline void geni_se_setup_m_cmd(struct geni_se *=
se, u32 cmd, u32 params)
 	u32 m_cmd;
=20
 	m_cmd =3D (cmd << M_OPCODE_SHFT) | (params & M_PARAMS_MSK);
-	writel_relaxed(m_cmd, se->base + SE_GENI_M_CMD0);
+	writel(m_cmd, se->base + SE_GENI_M_CMD0);
 }
=20
 /**
