Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83B9A91E74
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2019 09:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbfHSH7H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Aug 2019 03:59:07 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41235 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbfHSH7H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Aug 2019 03:59:07 -0400
Received: by mail-pg1-f194.google.com with SMTP id x15so731437pgg.8
        for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2019 00:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7Rp5t9j+7DDXl/rQQ53w+9HN4FSAN4QmyqQPRhhskv0=;
        b=GhitA5c2wExSJytQE+p99s9kS056pyftwbfTwXcR+NqxKVoE7P+BhDr26Wy4iNn/Yg
         04VwDsZCdy1mAN1HR7Q0g/6OOiajBxnEELtiYlkoUNyOzvEoOqZSoeIUdtUDOnJaRnZh
         V5/0a9AhJh0/qoj8YjDkSpxkVmpcO24YQiuxhCPz7U2zpmD0oWmRATw5uAB/l+zVLKyQ
         vfAQr90w1I+DQza/jL0gSq5o5GOZf2bQImQzNKUmitB9/Ss65iFyVrzTwoP1Jti7UraH
         ox/SEHeal6EgHugE1Q9QX2CHR0OKPA0aKvQbW60oCEb7w40BxJmCjhQ+Hp6ZLiqitAU7
         f9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7Rp5t9j+7DDXl/rQQ53w+9HN4FSAN4QmyqQPRhhskv0=;
        b=tc5SwqeH993Ej4i/xqZywmRHNI96TRlwn6R2l04LeTIyI/W40VF3WCyMs4FjLaoulA
         KSs1Vrc08C7NSwPK7GEJU35BayQ2wiTXouQRrj2Fdzl7/kPFNz5ZRwmoRJafEFf6u/k1
         bg67oQEjP01VXQdkIvXPaydZsczXJiNSvm/wvBh5B6mb2vRGiV4bXjbMiv1neMp2evCI
         /Mjzu+tMOa4dEPuCc7td7y+tGOqS0hVq4E7V1F0mcGS7s7zzw8cbcnKZyUB125O05U/Q
         DS8XxC8A5denavltHd6OXSao9ufWkzPLKRvVVUEVg3BTGwpmsp2PnZjelzC2gEVO3YqP
         mXQA==
X-Gm-Message-State: APjAAAWOLRjw+FB15py/STBj/3OetlChLU/qcVrXycYLjS8Mi55679z0
        DllA1+ZwzEi4H9f5xeERWLg=
X-Google-Smtp-Source: APXvYqy7O+TQ+Q7DCNZtZ2kH2BPQJsEtjJ3zwCWr5YLcOzNOeUMtp7irizwiqhL8lHxLkGZTjeQM1Q==
X-Received: by 2002:a17:90a:f012:: with SMTP id bt18mr18934231pjb.10.1566201546908;
        Mon, 19 Aug 2019 00:59:06 -0700 (PDT)
Received: from localhost.localdomain ([110.225.16.165])
        by smtp.gmail.com with ESMTPSA id t4sm17106658pfd.109.2019.08.19.00.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 00:59:06 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     ard.biesheuvel@linaro.org, linux-i2c@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] i2c: synquacer: Make synquacer_i2c_ops constant
Date:   Mon, 19 Aug 2019 13:28:54 +0530
Message-Id: <20190819075854.1960-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Static structure synquacer_i2c_ops, of type i2c_adapter, is only used
when it is copied into a field of another structure. It is not itself
modified. Hence make it const to protect it from unintended
modification.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/i2c/busses/i2c-synquacer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index f724c8e6b360..39762f0611b1 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -526,7 +526,7 @@ static const struct i2c_algorithm synquacer_i2c_algo = {
 	.functionality	= synquacer_i2c_functionality,
 };
 
-static struct i2c_adapter synquacer_i2c_ops = {
+static const struct i2c_adapter synquacer_i2c_ops = {
 	.owner		= THIS_MODULE,
 	.name		= "synquacer_i2c-adapter",
 	.algo		= &synquacer_i2c_algo,
-- 
2.19.1

