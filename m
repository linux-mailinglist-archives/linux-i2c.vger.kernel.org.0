Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1B6AA7291
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 20:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbfICSdo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 14:33:44 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33811 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfICSdo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Sep 2019 14:33:44 -0400
Received: by mail-pf1-f195.google.com with SMTP id b24so11334958pfp.1;
        Tue, 03 Sep 2019 11:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8fPcA2n/gw3WbMf6U41vJ1QWvF2zPzp7zyhN3MXEYHU=;
        b=Cw59jTH88uVS+Va/wBCMnpIyhKcT9Dw92ntEcxEBuhJFwbCaAmy8++hfXyusGDgNez
         inMV5uLSyb0TsjeNgzYvk3bAjm+S7ckPGHxbpW1bFsmrERMtVcnwSXGPdNX1LdQjb03K
         UIROHm2T7k1E6YtQn+VUuvtG8I/znJf8F+yBhIrNCpXiX+e+dIMWY9g/9ilivZMcV72+
         xbWSQrFd4Fg9ay34H9UqldiQyVGThM6EzzrO2NWxY8wR4K15oy2YTaVrsncE92yQhP99
         r80PMf5LO4PvZ9MjjxHGjjf5ZZMVsJaAnWq5QUGCiOc9MdQADZRZo1HfI8Qfm/BXDIcj
         sdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=8fPcA2n/gw3WbMf6U41vJ1QWvF2zPzp7zyhN3MXEYHU=;
        b=l9PfEPeH/05pFVHIgaFN5JCVe1f6ephuBiAhyV0ruDJjFopb7j0i6CXfdaNhAdxISc
         pbiZy8Kft1xfIBT/t7KzvmIG4eJoP2iz+I0Bhm8FsAF0/vaGBKqEZYRKyy49ar3ig5Yv
         StN4GwVcPGgfZu21SAuqb3n+yGmXPlcfTok0z+alYrkf5qhghRhAdl9FotIyuvGZqQ2n
         ZtC+e2AfjYiIOwQR3ua92IGkdURat3hm0+lj5clg16iFfOkGx1MG5TT3kuXEHS9/3rZF
         TbR0M6pREXzvwb5Hds8IoJ+zYIHofD7IpKOv5oCpPt76HEYVKxDbp2gUTaXTRBgxdoo5
         Mtxw==
X-Gm-Message-State: APjAAAX3FlQzz9Emz/Kk+oSn2zvmIhj548qMr/N8VsWUYRlyUnPXkEoO
        AXOCm7ZVdQEFYm15UXtMXVg8Rr1Y
X-Google-Smtp-Source: APXvYqzMaN+LKRUINHBzLWlDSuuzKG7G8aylSlRYk/1SS1pGn9mlUOUJebB6VBCjDhcuDnthBL0ESA==
X-Received: by 2002:a62:8246:: with SMTP id w67mr43013468pfd.226.1567535623359;
        Tue, 03 Sep 2019 11:33:43 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a186sm20119246pge.0.2019.09.03.11.33.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 11:33:42 -0700 (PDT)
Date:   Tue, 3 Sep 2019 11:33:40 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/3] hwmon: convert remaining drivers to
 i2c_new_dummy_device()
Message-ID: <20190903183340.GA29077@roeck-us.net>
References: <20190903181256.13450-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190903181256.13450-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 03, 2019 at 08:12:53PM +0200, Wolfram Sang wrote:
> This series is part of a tree-wide movement to replace the I2C API call
> 'i2c_new_dummy' which returns NULL with its new counterpart returning an
> ERRPTR.
> 
> This series fixes the remaining hwmon drivers which could not be
> converted by my cocci script. So, I did it manually, yet all drivers
> still follow the same pattern. Build tested by me and by buildbot. No
> tests on HW have been performed, so testing is appreciated.
> 
I still have the previous version (with RFT) in my queue.
Question is what to do with it; I have not seen any test feedback.
I tend to just apply the series and wait for fallout.
Any objections ?

Guenter
