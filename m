Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8631538B693
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 21:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237577AbhETTDD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 15:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237219AbhETTCs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 15:02:48 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F0E4C061347
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:25 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id p7so14986273wru.10
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=loGMcp+zvtQjcUAqjhc/c8MuJfmRyYr1CiSfoFAmBjY=;
        b=RVcJhbK5OzGAKGhBEQ7dreDeedoEXywfTqMLZz/I3jtPJ+WHPz482VcaSmiR+xExyi
         6lI0YSm+hJuZr9gzxRHrYTwSYYar40ln4SZ87ryqDaS2ulpP2BwusmytWxnNbdKIWqPz
         wWl0qd/mlECYGWTHddGX4MRG1AmI7gcafNkSNp+HVDYVByWgh74VzMXAUEQvbh9AON1W
         TLeGRfsxrh5G8f41eqKaBaxC2HPsMzH6o/nolH2BbGH0oxzDLQuAmR67Xflk9BDtRcZW
         dDaAGLRIT8l+iTmasRYoX1UEckXPlaFH9+OvxRJKIAOnYyYY0P6H0MsQzbZaQsDlX081
         QURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=loGMcp+zvtQjcUAqjhc/c8MuJfmRyYr1CiSfoFAmBjY=;
        b=oTb1mNwxF9AtXD9z8EkQKBqayPdpVa6UEI1xtHsM4cpiNgXoL6kjILP+88MzwHYDUO
         diEk4tu1rMtzZQ6/X7n6l7Y6uVlW/uiBBSzEUMTqngipRqGo0JMChii9aajIXA6Xbmwi
         zab730h8ODiA5s381k7Rb3mlQMm58WlhbFzEid6y0iKqoentKnd2gd2uZt6Fj+lHI1nu
         0poFZdNRGKofQ6YtmLeaMxm+l4Ah+FICcfiQDrS9OWPOJmq0BFNu/tSDOwU7Oong3oqW
         T1EL6Lf86esFWES6H7S5HRoh4wYPM3UzTsLX3fRSQIaYfjgsBbqYQOMHWFpO5YvJJebZ
         BmLA==
X-Gm-Message-State: AOAM533P4gDVZV9Te9Vdy8Hm782U7zxCM4WM+ZBMi6NJyV81jVngq6qk
        zcuKcWSL6O/wTKbpRUHTQhrD7Q==
X-Google-Smtp-Source: ABdhPJyJdvsBbfHcoAXj7al8tK05VZhCy3FTeBXG7MNR7954PwJVyYLTR97iocGRI99ppqAEGOvvFQ==
X-Received: by 2002:adf:e0c6:: with SMTP id m6mr5977858wri.66.1621537284229;
        Thu, 20 May 2021 12:01:24 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id p20sm9011899wmq.10.2021.05.20.12.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 12:01:23 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <maxime.coquelin@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: [PATCH 13/16] i2c: busses: i2c-st: Fix copy/paste function misnaming issues
Date:   Thu, 20 May 2021 20:01:02 +0100
Message-Id: <20210520190105.3772683-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520190105.3772683-1-lee.jones@linaro.org>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/i2c/busses/i2c-st.c:531: warning: expecting prototype for st_i2c_handle_write(). Prototype was for st_i2c_handle_read() instead
 drivers/i2c/busses/i2c-st.c:566: warning: expecting prototype for st_i2c_isr(). Prototype was for st_i2c_isr_thread() instead

Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Maxime Coquelin <maxime.coquelin@st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/i2c/busses/i2c-st.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index faa81a95551fe..30089b38044b5 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -524,7 +524,7 @@ static void st_i2c_handle_write(struct st_i2c_dev *i2c_dev)
 }
 
 /**
- * st_i2c_handle_write() - Handle FIFO enmpty interrupt in case of read
+ * st_i2c_handle_read() - Handle FIFO enmpty interrupt in case of read
  * @i2c_dev: Controller's private data
  */
 static void st_i2c_handle_read(struct st_i2c_dev *i2c_dev)
@@ -558,7 +558,7 @@ static void st_i2c_handle_read(struct st_i2c_dev *i2c_dev)
 }
 
 /**
- * st_i2c_isr() - Interrupt routine
+ * st_i2c_isr_thread() - Interrupt routine
  * @irq: interrupt number
  * @data: Controller's private data
  */
-- 
2.31.1

