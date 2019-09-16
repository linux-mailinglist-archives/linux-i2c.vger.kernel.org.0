Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AAB0B40A7
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2019 20:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731309AbfIPS4W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Sep 2019 14:56:22 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36866 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730202AbfIPS4W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Sep 2019 14:56:22 -0400
Received: by mail-pg1-f196.google.com with SMTP id c17so514735pgg.4;
        Mon, 16 Sep 2019 11:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=sxGs8CmmY1WK7QCVhx4smH+D6m6dkHLAhhA83hUYZAU=;
        b=RovtB6G5pixDL5MTHHf8heGYlD0TxnM/U5j6InSw25m79pcOlDSU5a7DR71xpUj4JS
         7GLNwnCkBwELiNjfuYKxAjQCxy7EjqwgDGDhjbaU7+tXaFDhduLWtfFqS/jfcBaMsCCC
         SXquM5bmFSw/t6GnOO992DAyBk/lQ57M17544icoo1LuUN1RzKRcmqz+JMgFL5JGK8Ee
         PXuTMNCBhbyKu1m8D2rIZcuJNvM3n7Ks7BOCmWZrlNVCWtG9Mo59RBavXSNBeWA3mROI
         9LfrYpxynYDkVxo7zaxIcirOLl3n2em/fUnkF3fnRbKrwR6tf/yz6XKO3QRkKLzKjj8y
         22hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=sxGs8CmmY1WK7QCVhx4smH+D6m6dkHLAhhA83hUYZAU=;
        b=INiBe3mYLCzJOkwyXJe8oBDhwANQaDEhB1jtKnDAgC0Hj8LAlI8Z73mZqZNz0z4fk9
         tzrb2d24IQb+CoM4jTsrCW8yXNTNxzzk0M4wFjnAUQUgrXHMjknXVFc4I2dx94Po4iIv
         75epNnMJO5uCqCM6LUEs3n7NSC7FaLRtDwd+TQY9QuIr1q9HVYcFBgpdRwXrPXtRSxQ/
         KejZ2Kj7QZQUSEe/+QcRNsXm05jmdg0J2rQA6Z8xaQ5o3n6XtHpWsRtujMw7ubfi3uFo
         cwDxdb5z7ZxAmXW0NSpsOal2nC/DTPSUbzCAot0p+mqe4bw8U8jGF7my8z3ot+Wopesl
         Q9kQ==
X-Gm-Message-State: APjAAAXhAnisRVjGZMgIYrRWy9GX9w1UGmTRzERG3OkkyrdTLvxcdUYE
        CM3dBPaYJh8wHd2enkcICLMTysSq
X-Google-Smtp-Source: APXvYqyJnO7t9TK4Tfy/Fnb5+oaGMPpkd0z87ldJqK2AZnbK9JcZ8VTf9p6bayukQ3JfBWNQ3/kOqA==
X-Received: by 2002:aa7:96cd:: with SMTP id h13mr847021pfq.21.1568660181279;
        Mon, 16 Sep 2019 11:56:21 -0700 (PDT)
Received: from SD ([2405:204:828a:aaec:8514:49dd:92d4:793d])
        by smtp.gmail.com with ESMTPSA id j2sm38740312pfe.130.2019.09.16.11.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 11:56:20 -0700 (PDT)
Date:   Tue, 17 Sep 2019 00:26:06 +0530
From:   Saiyam Doshi <saiyamdoshi.in@gmail.com>
To:     agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Fix issues reported by Coccinelle
Message-ID: <20190916185606.GA13764@SD>
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

Saiyam Doshi (3):
  i2c: qup: remove explicit conversion to boolean
  i2c: qup: Remove dev_err() log after platform_get_irq*() failure
  i2c: qup: Use devm_platform_ioremap_resource helper

 drivers/i2c/busses/i2c-qup.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

--
2.20.1

