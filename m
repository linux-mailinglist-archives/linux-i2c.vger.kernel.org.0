Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49C1A31B996
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Feb 2021 13:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbhBOMqJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Feb 2021 07:46:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbhBOMqG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Feb 2021 07:46:06 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC617C061574;
        Mon, 15 Feb 2021 04:45:25 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id o38so4135353pgm.9;
        Mon, 15 Feb 2021 04:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=giLNcwcbvZdBLBOunTE1fLTUGc05ZIFheWdA3C3pxDc=;
        b=lKUzKYkYBLEh7hNylgPDpDUytVlLlN8jd7azdbvm1Ze1xKTGG4N/BNA43QRicodk+l
         SqtjJ5AM5hkUxeSylAjBNhhmgof/Rb4u4xruesXLtoB6/1b/XlnZj0kViVUrcfqnF9ai
         CY5GHAV77w0B+6qoLdt5fcf9e2fkR2IzDm4ewSQPdWHiDw6+MTgn3DwLDkTrBCntNyRn
         6W+fsNnD2zNC6tP9dKXuXTX7IpdHKSWDNefNlVtXZXiW/KIyjXnyteR/jY63DdUW1ZU3
         ReESFw0IDjfQESDLQPeYg5iBRJVI2sS0C7J4fJowVJjzl67/xsrY4ZylNTvycvLZl1qo
         UfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=giLNcwcbvZdBLBOunTE1fLTUGc05ZIFheWdA3C3pxDc=;
        b=UHxKak1dWYkSyzpbGoz9XuoYs5J2/PtNKwJ43WK1ZyxWeO5NYepjGk+eqffjIa5b/5
         mLYORRi8Vxl5Q0BbTPffHfjnC496QJYNkbqLhp3w65CNI20Ro5IvIf6NarRnDDY4pJKu
         5fwVNKkXVA+1YvJi45yT6CCzj/Ffa6sgw4+hZ+aSX1EJxjgZIAIOrkvIP3hLT83Eb6P8
         IToBExIkcPGdKW5OG/h1u5RmHuBasuKK+T2+1HGTJE8AI2kn8/gbM5SZFutW7QfZpG7A
         hQDVn+o5ZTVWjFRGJwmj2y8/3s5Gs6/Uge3AQfhbotJQUEVQFuvSkDFCmk9e2FIfA+Db
         M3qg==
X-Gm-Message-State: AOAM531bIHLddd1K+Vhg3VqM3L0ehQvXkgWvSwampJ9j+ozjXFhOZTQc
        rFZ1g7+oe1Rx+UOVxlL6JHUEgmQ+m0AGYg==
X-Google-Smtp-Source: ABdhPJwNhKVB0w7UjVVZxr06wUNCW9GhRDE4K9udvbsUllaQZ0DcrONRewe//WCN5yETsukz9EzeRQ==
X-Received: by 2002:a63:4405:: with SMTP id r5mr14585640pga.168.1613393125564;
        Mon, 15 Feb 2021 04:45:25 -0800 (PST)
Received: from localhost (89.208.244.53.16clouds.com. [89.208.244.53])
        by smtp.gmail.com with ESMTPSA id m10sm17535952pjn.33.2021.02.15.04.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 04:45:25 -0800 (PST)
Date:   Mon, 15 Feb 2021 20:45:23 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        wsa@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH i2c-next] i2c: designware: Consolidate
 pci_free_irq_vectors to a single place
Message-ID: <20210215124523.GB618076@nuc8i5>
References: <20210214064529.481341-1-zhengdejin5@gmail.com>
 <1f388e27-6fe3-e218-5873-2158906e1098@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f388e27-6fe3-e218-5873-2158906e1098@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 15, 2021 at 11:36:27AM +0200, Jarkko Nikula wrote:
> On 2/14/21 8:45 AM, Dejin Zheng wrote:
> > Consolidate pci_free_irq_vectors to a single place using "goto free_irq"
> > for simplify the code.
> > 
> > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> > ---
> >   drivers/i2c/busses/i2c-designware-pcidrv.c | 22 ++++++++++------------
> >   1 file changed, 10 insertions(+), 12 deletions(-)
> > 
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Jarkko, Thanks!

Dejin
