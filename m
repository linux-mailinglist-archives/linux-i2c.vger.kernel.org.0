Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A54EB5435
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2019 19:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728784AbfIQR2L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Sep 2019 13:28:11 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39818 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727682AbfIQR2L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Sep 2019 13:28:11 -0400
Received: by mail-pf1-f193.google.com with SMTP id i1so2553463pfa.6;
        Tue, 17 Sep 2019 10:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=P2Um7Rko8n1alK6M3LQKKtwQ/oX8IiJYk8IZAkTV2KA=;
        b=ZRDafeier/fqo2Am0rGV8S0jbv08pyPI1aa4XbSfTKFdVpjunlgy96Hrap+UBdypoE
         VGDB4v99we0Oc4zvHwK/XhmtwN6EnfND3K9HkbQceX5Gw2Q/0LUkl6xOyoRwST7VgY0e
         PY+qBkFzlQtYfTfSXIPd808LQNDi3OUWCpLC3dIp3J84IOCp52uqRxgH63O47ZtccXeu
         GA/Am6IKKVl7ciM+fvvPGpWb4ar+j/Oy+zcgY/tvYzoAIvKp15m+tfyM0FkRe5+F+b/I
         n4EZh/ZkTH0T8bfW5giZ6NPY0/233fEVOVuzlhW3kVxQMIYs16SdcNxvTXNEB8iA85/L
         Dylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=P2Um7Rko8n1alK6M3LQKKtwQ/oX8IiJYk8IZAkTV2KA=;
        b=lsm+FQnI/itLQ5zuomU2YgWSwujrf6s/R++YutXoe0fVj3QAxyaWNyjZkuk25NPw6q
         DBtYa1cp3CKoEo1kYRncYu7UKh27kwRCYkytANSNzwrfeqiM0092040UxcR1eGTkv0Et
         vWhvFEvpsYrrrIACcQdw1vVSlR+RPLArhtTPCcpolK18L3i+ikAKX2b6NoiUUl6nOPbb
         c1AhbdiXonsVhRhqgOhejlRistPhuY+GCibsCuy/mk4wniT1EUdSUho5wAKz0e2UnVbf
         Atsy5hHlAu17yzKoV1p4yn6bS+5SgexquksFu1Hqxb3jbA/r8vbAt9IfYd/K7st9vRec
         AYYQ==
X-Gm-Message-State: APjAAAVuQndbC/wh6cGqBjANqYbEqveDl7tq5HdHJaEiePCJiGLOvitE
        zNWZn+hzXzSm+8HDavBnNtQCPJWB
X-Google-Smtp-Source: APXvYqxye4YNwKugrQYoyoTIv0SZ05YUURZ8hGUwtAIC07qnUQ8Nd6+FgWvoOGtUYJPxp7NSFIGnrA==
X-Received: by 2002:a65:5043:: with SMTP id k3mr3675956pgo.406.1568741290169;
        Tue, 17 Sep 2019 10:28:10 -0700 (PDT)
Received: from SD ([106.222.12.103])
        by smtp.gmail.com with ESMTPSA id ck13sm2806307pjb.29.2019.09.17.10.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 10:28:09 -0700 (PDT)
Date:   Tue, 17 Sep 2019 22:57:58 +0530
From:   Saiyam Doshi <saiyamdoshi.in@gmail.com>
To:     agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, markus.elfring@web.de
Subject: [PATCH v2 0/3] Fix issues reported by Coccinelle
Message-ID: <20190917172758.GA11926@SD>
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

