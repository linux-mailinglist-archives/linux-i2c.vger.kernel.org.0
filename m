Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 574BCB538C
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2019 19:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730670AbfIQREK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Sep 2019 13:04:10 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:32777 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730669AbfIQREK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Sep 2019 13:04:10 -0400
Received: by mail-pg1-f194.google.com with SMTP id n190so2359544pgn.0;
        Tue, 17 Sep 2019 10:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=P2Um7Rko8n1alK6M3LQKKtwQ/oX8IiJYk8IZAkTV2KA=;
        b=u16SdUdOGB2LLK/mGWmhW7AvoCPMmtYHrPR4NF7yEJXeguX86hVlDGt+Il3z1u2YdG
         Gg6+ls/YjLptyRd84oxJTBEhuBrmjI7MuokGyxKxfnGqe72u4yOY5YAt1kPuY9AQxj1m
         ZEDDJEV4bxwSf9YAgFNf+eea053uH+ZwKL9SGM6pfn57NCEgMnrZnlrYMHfQ7KuIeNwg
         a7CBJhMbM5Qe0xMFTUpG0PQFqdYVSSCZeL6BEpLDZf2xcpAhI17EFP/9LsheyMI+Dzt/
         rgpL+ox/Ak3H0s/Yn4W9VyPDvljb6yfa5j2lSwQ+E2Rz96F/dm7zCYLNoHMq4F6MDdtR
         fIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=P2Um7Rko8n1alK6M3LQKKtwQ/oX8IiJYk8IZAkTV2KA=;
        b=ZKfhgU1g8DRN09twoh9dJwMQK1GI7sessMV+0F4IFGOX50R3ifbk/jE1qdWo2Zi/1E
         CRPzGIWIOPSzPc45QcdiRXfphrr4S+46c1L071oqZqY5nhnqAwDez0Aft0I2fD+LoaCV
         AkXX3a+24G9KHPL5Srm88Uw/NKZSLKNqycXeL9+tBegfcE/YsaUGn0MtONJc0vkuo3kJ
         8Izp02lY+n8r03l86UAWf+e/wjO4zIa3RDdR93BLvTy1VdsidtIgcrQfmERpzJr7h0AD
         OGgM5MNwM6u5ARZVpJzPrruAIG2CyBjNLaGzDtynLQqDSmc31dZr3Q0C+gpHiGvvadvu
         J0Fw==
X-Gm-Message-State: APjAAAXt5DRq3+C5mL6lWDyGS9Ck/bRQfibuMHa7NxoPWccTUHxSANjV
        7O97d7NSiw4K4yIfdBgq9FY=
X-Google-Smtp-Source: APXvYqwz5xFcDYTrAlmz56RXpp84dT+0rWOj9LUjJ/O1638m2Eldcgqs+1nKSKIc0KCLZC9Z7yBbxQ==
X-Received: by 2002:a17:90a:1c01:: with SMTP id s1mr6097049pjs.76.1568739848250;
        Tue, 17 Sep 2019 10:04:08 -0700 (PDT)
Received: from SD ([106.222.12.103])
        by smtp.gmail.com with ESMTPSA id s7sm3072278pjn.8.2019.09.17.10.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 10:04:07 -0700 (PDT)
Date:   Tue, 17 Sep 2019 22:33:57 +0530
From:   Saiyam Doshi <saiyamdoshi.in@gmail.com>
To:     agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, markus.elfring@web.de
Subject: [PATCH v2] Fix issues reported by Coccinelle
Message-ID: <20190917170357.GA7025@SD>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Using cocciecheck to ensure there are no semantic issues in
i2c-qup driver.

Refer below links for more information.
http://coccinelle.lip6.fr
https://bottest.wiki.kernel.org/coccicheck

Changes in v2:
* Updated changelog as suggested by Markus Elfring.

v1:
https://patchwork.ozlabs.org/cover/1163043/

Saiyam Doshi (3):
  i2c: qup: remove explicit conversion to boolean
  i2c: qup: Remove dev_err() log after platform_get_irq*() failure
  i2c: qup: Use devm_platform_ioremap_resource helper

 drivers/i2c/busses/i2c-qup.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

-- 
2.20.1

