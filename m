Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F310116DCD
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2019 14:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbfLINRz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Dec 2019 08:17:55 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33777 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbfLINRy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Dec 2019 08:17:54 -0500
Received: by mail-wm1-f68.google.com with SMTP id y23so15428364wma.0
        for <linux-i2c@vger.kernel.org>; Mon, 09 Dec 2019 05:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=4+QA/tgnnIgBecFWO74sIEulDFPFsySoDm6BKiBPuIs=;
        b=TtHK5BAIe4p2p2E4v3xakR8r03HFNDQD5p0kmKz6BqeglB72D1LS8HQckhtJdHYF6s
         UcCKoi/Z26YLLdKCJZO+HHHQL+HS9tRQPacXFHLuQgBYAD6Ge4fuqL4Xf50Up5kaFVaN
         E80bJ/7qKJ6AT/ZB7OgrGuq10uBIRuE4u76wNjS+Lk13f9ERx82b9DEIdRszzMcWMBf1
         9RxdH5SvcD+8Ckh8gCm1KGVOFlAdQ53hzYeh+wI21DlPY1gKU3CrvPgqWRV/DqnAKBmp
         hS1dODN9nRn5R0AX6pWoVsavUa3k9tmYxyDfUiYCEImgVQi1CgqfeggiiOQiNHZ/L8m/
         /Q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=4+QA/tgnnIgBecFWO74sIEulDFPFsySoDm6BKiBPuIs=;
        b=EGFTlT2mjnI5vA2BTJ9DfscJeabV7I7aAehwdPvhP1PHlgpTjM42wSc9yoPFjU6MJU
         mr7/dsGRDEk7T1BM3WEU3mwbJy+IlTxcIctsUTFxFfzMXINuf2pZIlYD5krayaUkVh36
         tl3+fpYY5nPDd5wj9ztJM6wxWWdxpiunUboSgjyh9vNXZ992tluRkf1/a77S/v/7aVyD
         32P3CCgBwTNXEWCX2GEsW7bW+BkzAqVly3T3HCUdvBTmMZPf54JkVQ1MKNSQL8vMntG0
         5R1uAOiLe4Qmkwp3MciTuSk1b+hhMMEzcN103OqOi5829+rG7iiuFNUkyDB6QFSm+sWo
         3k0g==
X-Gm-Message-State: APjAAAWXE2BIbyKj+5cg/T2O9DZ180KWeCF71OfdSi7k/df49W8wmxly
        9NuolsQo+FwWdLxT08XESAT1ug==
X-Google-Smtp-Source: APXvYqyRDWEKFoDHnaCmaf2MHVbQ5xRPyxwdKLhtWp6mVWE70kvawyamBbCkIcnqRzgXhvTg64VXvw==
X-Received: by 2002:a1c:49c3:: with SMTP id w186mr25635339wma.53.1575897473285;
        Mon, 09 Dec 2019 05:17:53 -0800 (PST)
Received: from dell ([2.27.35.145])
        by smtp.gmail.com with ESMTPSA id u14sm26646505wrm.51.2019.12.09.05.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 05:17:51 -0800 (PST)
Date:   Mon, 9 Dec 2019 13:17:45 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     enric.balletbo@collabora.com, Wolfram Sang <wsa@the-dreams.de>,
        Akshu.Agrawal@amd.com, Guenter Roeck <groeck@chromium.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-i2c@vger.kernel.org, Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH 4/4] platform/chrome: i2c: i2c-cros-ec-tunnel: Convert
 i2c tunnel to MFD Cell
Message-ID: <20191209131745.GM3468@dell>
References: <20191121211053.48861-1-rrangel@chromium.org>
 <20191121140830.4.Iddc7dd74f893297cb932e9825d413e7890633b3d@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191121140830.4.Iddc7dd74f893297cb932e9825d413e7890633b3d@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 21 Nov 2019, Raul E Rangel wrote:

> If the i2c-cros-ec-tunnel driver is compiled into the kernel, it is
> possible that i2c-cros-ec-tunnel could be probed before cros_ec_XXX
> has finished initializing and setting the drvdata. This would cause a
> NULL pointer panic.
> 
> Converting this driver over to an MFD solves the problem and aligns with
> where the cros_ec is going.
> 
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> ---
> You can now see the device node lives under the mfd device.
> 
> $ find /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/ -iname firmware_node -exec ls -l '{}' \;
> /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/firmware_node -> ../../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/PNP0C09:00/GOOG0004:00/GOOG0012:00
> /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/i2c-9/firmware_node -> ../../../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/PNP0C09:00/GOOG0004:00/GOOG0012:00
> /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/i2c-9/i2c-10EC5682:00/firmware_node -> ../../../../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/PNP0C09:00/GOOG0004:00/GOOG0012:00/10EC5682:00
> 
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c | 36 +++++++++----------------
>  drivers/mfd/cros_ec_dev.c               | 19 +++++++++++++

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
