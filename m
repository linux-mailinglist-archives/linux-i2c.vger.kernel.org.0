Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE68B9DED
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Sep 2019 14:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407619AbfIUM6M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Sep 2019 08:58:12 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40627 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407616AbfIUM6M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 Sep 2019 08:58:12 -0400
Received: by mail-pg1-f193.google.com with SMTP id w10so5381746pgj.7
        for <linux-i2c@vger.kernel.org>; Sat, 21 Sep 2019 05:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=Mu+zBpq9b/jWdQOUN8vxIvFaJLLO4vVxC25/55CrgIk=;
        b=FuXKtizcxT2hsPdUFIOC51abOVFlTo2gSGMtkvcYlozFzhfG9+h0qlMGDIvmnY8yPM
         Lmu+fOCm6KbOIjAqfSMi3d5ENNTrFlCVDM5Ww2DwOWVT/Nn0AdAsNONznEmiIzzpa+yk
         6whMFKP2paZ+EvgwRoWO+JXIcgZKJnQghV3NB36yQ2eSPSndv2imDh85fPGcQ4Mo6rGA
         Bh5gE2b9tQ2zVGpT09rHtvdDkMCJXYZxJY1Tg6S/ixmModyIjFguZSDuC2uFq7sjAtZk
         fTw+jYCPObuFnqmux/xwpLq6n0/N9kX4jLarfgpc1QY8kM7ys/3K0cFwN+ANAppFaj18
         dfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=Mu+zBpq9b/jWdQOUN8vxIvFaJLLO4vVxC25/55CrgIk=;
        b=XfI/MtN6grd9trj+jqEbNMfolZ04vdsnQMPw+C/abatH2aEjloe8rZrlOQFfPJpq2d
         /bD3lWREAsRLthkAlg76/yoVmXnFCSIfZvnNwW/FC1qoHXak/O2gqA+qd6xyK/Pirn7Z
         IaU26YwCvyjNp3XIm0/RkEyrUj1StQpGoHEFtm+xltrnqCpDj6uOE6fb2msCoFSScvOl
         6h5Xsa3Kv7fVeCMl+ZTjYhVknno8O3nVK+RRz/+v+lPtkJoWVO3o/8bTg8xjj+4hB+Hg
         6cEirB2gUXrya06/bSjA5DMZJOFkl2XU3PTJN8AE6YUGfs63OjI1cBt6A7KKYjH87V4w
         Wa6g==
X-Gm-Message-State: APjAAAW9Tzay8B6NnqQ/U2SmS6B3KB9xHfx7BsH3LA1kkVPmqysalW4g
        q55ZK2TVwugnlzY4sz7EB5Q=
X-Google-Smtp-Source: APXvYqx95bK+2jBI1/IX4H1wFwrDl79u9mJvUOi6D2J5FHFTaieAk5HD5XxADe1OzhmLAfZd6aIkiQ==
X-Received: by 2002:a63:e853:: with SMTP id a19mr19525741pgk.296.1569070691300;
        Sat, 21 Sep 2019 05:58:11 -0700 (PDT)
Received: from gmail.com (ip-103-85-37-119.syd.xi.com.au. [103.85.37.119])
        by smtp.gmail.com with ESMTPSA id q88sm5950883pjq.9.2019.09.21.05.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2019 05:58:10 -0700 (PDT)
Date:   Sat, 21 Sep 2019 22:58:04 +1000
From:   Adam Zerella <adam.zerella@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-i2c@vger.kernel.org, Adam Zerella <adam.zerella@gmail.com>
Subject: [PATCH] i2c: busses: Convert parameter to __le32
Message-ID: <20190921125804.GA10910@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The assignment of `serial` is using le32_to_cpu() without
first converting the parameter `dev->ibuffer` to __le32.

This produces a Sparse warning of:

`warning: cast to restricted __le32`

Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
---
 drivers/i2c/busses/i2c-diolan-u2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-diolan-u2c.c b/drivers/i2c/busses/i2c-diolan-u2c.c
index 382f105e0fe3..32de47eda950 100644
--- a/drivers/i2c/busses/i2c-diolan-u2c.c
+++ b/drivers/i2c/busses/i2c-diolan-u2c.c
@@ -289,7 +289,7 @@ static void diolan_get_serial(struct i2c_diolan_u2c *dev)
 
 	ret = diolan_usb_cmd(dev, CMD_GET_SERIAL, true);
 	if (ret >= 4) {
-		serial = le32_to_cpu(*(u32 *)dev->ibuffer);
+		serial = le32_to_cpu(cpu_to_le32(*(u32 *)dev->ibuffer));
 		dev_info(&dev->interface->dev,
 			 "Diolan U2C serial number %u\n", serial);
 	}
-- 
2.21.0

