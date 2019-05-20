Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF2102408C
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 20:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbfETSjh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 14:39:37 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40855 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbfETSjh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 May 2019 14:39:37 -0400
Received: by mail-pg1-f193.google.com with SMTP id d30so7182796pgm.7;
        Mon, 20 May 2019 11:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=dWlch1Qto6o5TeE09hdtn0RshYrOaDgWzuk3sDfhUkw=;
        b=szyBKWyxKJdy9A4IuRCgJsVIGpFZxnqnqqFlLj996VXA8oZLVknv5qoi6znVySzvdx
         s74NcVtxzA01NFAdOsAjf2q8sevj8ArgAp0jtz9JDzGQbY9snxtX5KKNFTw5XWP052++
         p01if6BIgolgPmUMCQjB+XgmtFKyHGhIOqspgOEf6g8qy4LYTbSwBH/hN2RutINzWHMJ
         SnSQeersCCQyvZITbhWgUczD69qsU6rlGx8WisKgDJZdXSuWlq/AUQuV8v4OvYBH7HRw
         xg9V+UhXsJ/zKEcaLi0xMV+PeRjdh/6/iBhpcnvRpTbweq4B3WrPXjk79ZtocL13MnS7
         5a8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dWlch1Qto6o5TeE09hdtn0RshYrOaDgWzuk3sDfhUkw=;
        b=qr3H9NZbGn87DhMVYQW/6332+udVg0e2JH98Uc65gsEatpWAIixuBrFxbDJvnnCz+9
         W2OX1ZzChEz4GfeRDNQNGrvB0AyFVCT2ILszX17aGUBWAf3dW3RkUF37VYqsaaRzqA8d
         qIzoDicUYXiRZxiPuzUcF+qmHUAKJKd6nq/7uYRdxMseSz4xlxLuC/aexZZe5SmKt/b9
         nzn8YFV3C6G3CC5vMMzSxFeheKdgETM13h/3zgw3sio4wBLLv/HQqozC/xA2hBazS+VW
         ajudMCs4CdXr7jG82ru4p6fpFqPvKOFF7wxrMwR207/C3ksNsjKFl1CKLaWF2F/0WetB
         q+wg==
X-Gm-Message-State: APjAAAXOIiT93IhUwRRheWPcrcW77d8Ryn8PYYGRtjkg3pQoOsqnzDYP
        CYX93b91v4ydEDSB5ERGprymB+jssC8=
X-Google-Smtp-Source: APXvYqzWofK28b+JsNF57Mt0GUg60mj/jOvHcQIufyuj7/ZuakJaVA8ZPt9Ifhtl4xOECuhMh3u9IA==
X-Received: by 2002:a62:d205:: with SMTP id c5mr81295213pfg.219.1558377576904;
        Mon, 20 May 2019 11:39:36 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id o20sm22321288pgj.70.2019.05.20.11.39.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 11:39:36 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com, wsa@the-dreams.de
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v2 0/5] usb: typec: ucsi: ccg: add runtime pm support
Date:   Mon, 20 May 2019 11:37:45 -0700
Message-Id: <20190520183750.2932-1-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heikki and Wolfram

These patches add support for runtime power management for UCSI CCGx driver.
I have tested them with NVIDIA GPU card which has i2c interface to talk to
CCG controller. I have added runtime pm support for the i2c bus driver as well.

First patch refactors master_xfer() of i2c driver fixing comment from Wolfram.
Second and third patch add support for runtime pm in i2c bus driver and UCSI CCGx
driver.

Last two patches add workaround for an old version of ccg firmware
which has known issue of missing interrupt when a device is connected
to runtime resume the ccg controller. The workaround is needed because
if a GPU card doesn't get new firmware but gets new kernel then also it
should continue to work. The workaround is to request runtime resume of
i2c client which is UCSI Cypress CCGx driver. CCG driver will call the ISR
for any connector change event only if NVIDIA GPU has old CCG firmware with
the known issue.

All the five patches should go together since ucsi_ccg driver is dependent
on i2c driver for runtime pm wokaround. I would prefer it to go through
usb-tree since usb ucsi_ccg driver is the main driver getting runtime pm
functionality with the series.

Thanks
Ajay


Ajay Gupta (5):
  i2c: nvidia-gpu: refactor master_xfer
  i2c: nvidia-gpu: add runtime pm support
  usb: typec: ucsi: ccg: enable runtime pm support
  i2c: nvidia-gpu: resume ccgx i2c client
  usb: typec: ucsi: ccg: add runtime pm workaround

 drivers/i2c/busses/i2c-nvidia-gpu.c |  60 ++++++++----
 drivers/usb/typec/ucsi/ucsi.c       |   1 +
 drivers/usb/typec/ucsi/ucsi_ccg.c   | 140 +++++++++++++++++++++++++++-
 3 files changed, 181 insertions(+), 20 deletions(-)

-- 
2.17.1

