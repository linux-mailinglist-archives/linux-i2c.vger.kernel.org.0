Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91CB0B40B2
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2019 20:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730949AbfIPS7J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Sep 2019 14:59:09 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42839 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727917AbfIPS7J (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Sep 2019 14:59:09 -0400
Received: by mail-pl1-f195.google.com with SMTP id e5so298702pls.9;
        Mon, 16 Sep 2019 11:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=DzSndrAt3W5Qpn/Z0ZHFWHP+YFwM5pnaWCeVZxGk0sY=;
        b=Fl/lu1AW2AU8GF/kHqNLOJrGi83gqhB5xB5qlXB/KthNnSLzz5EYA4ukoHaafGNFie
         GjteLbBxdSWqul4vNC7SWnAjX8l27OP/TnTKXrn9n/33TMu+5L2siDJtgBmRVmdErxCd
         kB+U8yAhJYLMHNZsaAvxW0QNNWVt1raRY7RHiGi8Wh02RRLUNgaEryBxIh21loZ+EWz3
         n4jSWd/5kEe1mQ9RSzozRakqNFuhd6iuCb4/SKppjbvFBmmvz9FMhD1sk6ouTM83aHzo
         wLKyRX+1FDZ72/LapQ1mbMTBA/xF9wz8WaiDhiwRnFXQ13vetbAGl948H7IPAyPCqXIJ
         ZUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=DzSndrAt3W5Qpn/Z0ZHFWHP+YFwM5pnaWCeVZxGk0sY=;
        b=RcDLAXbsqwJQMFgRSC81O1vuimPYZGbrHJKsTBSCzpedV4q1ElwP2fQUH90RMVT4wy
         bTx5QmhwKHZ7FaWX4pY9dFvbfE1dx3B5CUtMcYK6O9Njsxej+xMVrogriIgUdoVNStYu
         u5Wv2VyZThAtr4D1A4YYTca1xCSeLppdv6R0+h3i8GLqYEfugwl0Y4c6UBRucGQaLMds
         IvcW09H9s7+l0lxw1NMdE5E65JayqixlTIPw48+29hiZ+mCkIac2qRgWIWPCIZxd5m/p
         lOaGJxVqrZcxmtkM35MMj+1pw/D2giCCPkG3QT+fpCSO51pUx+yhQZzJ63NPIXVR04Yh
         OsOA==
X-Gm-Message-State: APjAAAU0cnr2MIonZu5TIZSFv7p7QJCGZECMcZAzTzGMmJh9lP7Pscd3
        /HHix80w/MDyBaWWh1LBEKo=
X-Google-Smtp-Source: APXvYqzQ7HX/m71MhWZKhGi2AZRp1T02V0yWaNMHVqCTdxTfUiu5p6wVz95QCk/XUDLg9ns2CdI3Ug==
X-Received: by 2002:a17:902:b688:: with SMTP id c8mr1244877pls.98.1568660349002;
        Mon, 16 Sep 2019 11:59:09 -0700 (PDT)
Received: from SD ([2405:204:828a:aaec:8514:49dd:92d4:793d])
        by smtp.gmail.com with ESMTPSA id x8sm37279153pfm.35.2019.09.16.11.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 11:59:08 -0700 (PDT)
Date:   Tue, 17 Sep 2019 00:28:58 +0530
From:   Saiyam Doshi <saiyamdoshi.in@gmail.com>
To:     agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] i2c: qup: Remove dev_err() log after platform_get_irq*()
 failure
Message-ID: <20190916185857.GA14093@SD>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The debug message after platform_get_irq() failure is redundant
because platform_get_irq() already prints an error. Thus remove it.

The semantic patch that makes this report is available
in scripts/coccinelle/api/platform_get_irq.cocci.

Found using - http://coccinelle.lip6.fr/

Signed-off-by: Saiyam Doshi <saiyamdoshi.in@gmail.com>
---
 drivers/i2c/busses/i2c-qup.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 5519c19bfd9c..23c4893512b2 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1767,7 +1767,6 @@ static int qup_i2c_probe(struct platform_device *pdev)

 	qup->irq = platform_get_irq(pdev, 0);
 	if (qup->irq < 0) {
-		dev_err(qup->dev, "No IRQ defined\n");
 		return qup->irq;
 	}

--
2.20.1

