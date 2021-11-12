Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686D144E78D
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 14:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234918AbhKLNm4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 08:42:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234929AbhKLNmz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Nov 2021 08:42:55 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10AE0C061766;
        Fri, 12 Nov 2021 05:40:05 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id a11so2394822qkh.13;
        Fri, 12 Nov 2021 05:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NAtFa3t6wILHx+ukRPCzhBCxhx6HrcnOJgLiSrGBeJw=;
        b=Lu52eK1D+xOiDfX4V3esM0FweLV+1NlFg+nzSyhdvpC7eKeoemgPGGIktTQQiOli4N
         5Y2xDH6vEifY7KzmnrDTNCDNuT1KhY/2QJ/UbL3Xi+n1dtI4Wyze2Fb97/61Xbm4QLHW
         a8Jkq0RZDlhecc3IqNJ3/W6K1YVjvVLOEn8aqnzP7XMG92qwhNq74x1pLOMscnpumIY6
         XCBAnOl0XSnNmnNs+EJeXgwPLS9fOxYtx40dO/WDk7yIA0fdoMRUauJvVADsJ/4glC0a
         ku03P2gwRg3xnCiciLQZMLg752nrKAHcH8lweRTASHAT6l/FLKnOU2yY585i7di80ps3
         VT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=NAtFa3t6wILHx+ukRPCzhBCxhx6HrcnOJgLiSrGBeJw=;
        b=MjiWddDxIdgKjMR2TvLGJOIoLIflVzEjap0hy2DY7JdiNTmoNvbOZFtNeyvi30fL2b
         F88cGlEsc1SrZLZc3P1lhxz5ymkisNWQJgTJ84sf7ucm0gG/1XlvUDQIazsstGtAazyC
         5MtFSeH7Ps0kfQREDKWiIcbfo+Ya1kQlyPnQkmLk2zxowmRgIqP299CPZ2+Gd3pSLfvr
         8EMQuqdJ+m2Gxd2qHyzONLd6tkELSA8p1cQyuEsQunnfxZB/wPqXTFU1CQDQ29ToxLqX
         ZOhQgGqtFg9F/o8d4vYfYAXZN2KBvGm4gUd+esFo9OWbVY3XtWFS75lpjA4qx6bInRJe
         4oRg==
X-Gm-Message-State: AOAM532yBmdptkA9hiARvKX9DAC2uTxGVNtsHdAWLqRhgJ/62FN7Kj9e
        Ki7tH+0XCHUZo4A7sH/WdQ==
X-Google-Smtp-Source: ABdhPJwKwrxi/62HeyEkWFqjvJVpX0WepBlrekAGe0tS0sg99TP789rTPvwvHKDmiX9/3ROIIRGwTw==
X-Received: by 2002:a05:620a:1294:: with SMTP id w20mr13188632qki.197.1636724403989;
        Fri, 12 Nov 2021 05:40:03 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id br17sm2761097qkb.10.2021.11.12.05.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:40:03 -0800 (PST)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:3da4:ae9:63f5:5ac8])
        by serve.minyard.net (Postfix) with ESMTPA id 8A2D71800BA;
        Fri, 12 Nov 2021 13:40:02 +0000 (UTC)
From:   minyard@acm.org
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Corey Minyard <minyard@acm.org>
Subject: [PATCH v2 0/2] i2c:imx: Deliver a timely stop on slave side, fix recv
Date:   Fri, 12 Nov 2021 07:39:54 -0600
Message-Id: <20211112133956.655179-1-minyard@acm.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I was working on an application that needs the stop condition
immediately.  So this adds a timer after each byte is received/sent and
if the bus is idle at the timeout, send the stop.

Also, I noticed when you use the i2c-slave-eeprom, if you read some data
and then read some data again, the last byte of the first read will be
the first byte of the second read.  This is because i2c-slave-eeprom
expects a read-ahead.  That's what the documentation says, at least.

Thanks to Uwe Kleine-König and Oleksij Rempel for reviewing.

-corey

Changes since v1:

* Added a comment on the hrtimer cancel on why the return value didn't
  need to be checked.

* Combine the hrtimer patch into the main timer patch.


