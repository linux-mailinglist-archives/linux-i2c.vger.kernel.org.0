Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78EE0B40C2
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2019 21:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727959AbfIPTDK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Sep 2019 15:03:10 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36400 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbfIPTDK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Sep 2019 15:03:10 -0400
Received: by mail-pl1-f195.google.com with SMTP id f19so318409plr.3;
        Mon, 16 Sep 2019 12:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=O593HMHr1X+t/3lCKgBpvy9WSO86CaTojEYHPvt/fEk=;
        b=usgnhg07TRgsfaVdzt3E55MQ+J8ZG8EqLxQ4kckSs3uxRwVIVE0MRZ533n0fklbPf4
         pckxTev4WnlQh+hY4cmeCUHKr7qz80TmkeQj56c4uHzcw+K7/PvOLSd0fpsO1P2quZZ7
         OmbXUaaFu2SgIUmRpbVqHa5mNQsesQ8/0mL7yJ1MQItSEBUdtjzyUp0XNxtp5Bz2h77Q
         tNisNAoSaCBIofjqKWWBTbvJcb2nIGW949Xz+ucy3So40fB7+XBC807UIY+SH87oXgMl
         s/0ACbxVSc+LdAmFLaZxEij9evKOYVEeoukeCev3fjnh5ZrYnnacuiZ1C8qkck1ZhTuY
         7eKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=O593HMHr1X+t/3lCKgBpvy9WSO86CaTojEYHPvt/fEk=;
        b=eWwXvMHDEs1CaGKegezZiSG1c2H5BroiHiICUmCzojtCOt6r3JEnQS8EUh/KQC1B2p
         LUgQz3hGTGTdGOD+vnbCxdAKPKgdSXkVNn2BtJZuGSVIMiyI6jrE5cAfJC+RMKj/7oOd
         FoZhGlhwqRp1T58JMPM7Zmkn56jS3PAmvi2zsNx7MtMPI8P//NbGAP//t/Ug+wfkwXvS
         ylFLMpq1E2WVbzQvCCk4ysxP9p0WQ5oYJzyANVg4syV75P16e59B1JnET1EeohZ2WSwQ
         nY+0Y1A4r8NGzBfFy9JZ50SpFoBDJOICL3dE/LGMmzRxZXUViz814U9OYrkwiB9+gTji
         t3bw==
X-Gm-Message-State: APjAAAXoV6mwd8MkpU522p/pivO49HlmnkwgznNoBuIhIaWDnPw63tiw
        Vq9jJQKMFY9mfQiwYYyzgHxvEnD7
X-Google-Smtp-Source: APXvYqxuxI6u8zDVKZJbWfmjYLJJp9vLcVvaYS8HA2y5ASTUm3CVUjEZTsJMbtW3HHZqto0l/lLIAA==
X-Received: by 2002:a17:902:9001:: with SMTP id a1mr1400116plp.148.1568660588129;
        Mon, 16 Sep 2019 12:03:08 -0700 (PDT)
Received: from SD ([2405:204:828a:aaec:8514:49dd:92d4:793d])
        by smtp.gmail.com with ESMTPSA id i6sm67954035pfq.20.2019.09.16.12.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 12:03:07 -0700 (PDT)
Date:   Tue, 17 Sep 2019 00:32:54 +0530
From:   Saiyam Doshi <saiyamdoshi.in@gmail.com>
To:     agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] i2c: qup: Use devm_platform_ioremap_resource helper
Message-ID: <20190916190254.GA14207@SD>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use devm_platform_ioremap_resource helper which wraps
platform_get_resource() and devm_ioremap_resource() together.

The semantic patch that makes this report is available
in scripts/coccinelle/api/devm_platform_ioremap_resource.cocci.

Found using - http://coccinelle.lip6.fr/

Signed-off-by: Saiyam Doshi <saiyamdoshi.in@gmail.com>
---
 drivers/i2c/busses/i2c-qup.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 23c4893512b2..2d21168f81a0 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1663,7 +1663,6 @@ static int qup_i2c_probe(struct platform_device *pdev)
 	static const int blk_sizes[] = {4, 16, 32};
 	struct qup_i2c_dev *qup;
 	unsigned long one_bit_t;
-	struct resource *res;
 	u32 io_mode, hw_ver, size;
 	int ret, fs_div, hs_div;
 	u32 src_clk_freq = DEFAULT_SRC_CLK;
@@ -1760,8 +1759,7 @@ static int qup_i2c_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	qup->base = devm_ioremap_resource(qup->dev, res);
+	qup->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(qup->base))
 		return PTR_ERR(qup->base);

--
2.20.1

