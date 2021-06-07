Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A54F939DECC
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 16:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbhFGOdO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 10:33:14 -0400
Received: from mail-pf1-f181.google.com ([209.85.210.181]:37556 "EHLO
        mail-pf1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbhFGOdO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Jun 2021 10:33:14 -0400
Received: by mail-pf1-f181.google.com with SMTP id y15so13202716pfl.4;
        Mon, 07 Jun 2021 07:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h6CG2bMQTbzoeKiCNTYjo7P9Il/mWVmgFb8ULia79oo=;
        b=I9t1OZEZPobhkA3hf2acJxnViGRdaufqM5+op4JunH2jb4Imy6JUGmqUWmbEdg/EZ9
         5S/Xhj1avqhJwzAjtyuwGRkqRS0DW98mxmcm6B3d50Q+ZXi5Whkh9Tv2qSBmA9oUqUkJ
         QAQJpc9ji1ypPYx2KxT+m2jSaPs0CImK7xn4JbMFo2zrX7Fy0L0v9YEllNxCdPCDgglA
         FuOTczaNmB0/Us4YraeuoElsBkhRz+Qr1iiwX5G26bDDZanKZqohCCjWjFu2/EY0IeC+
         nnDR5fzju0H+np6EkQ4CRIJ6fQBbuV0RbVsFBuRVgMyYp/aQYFHnIr2VNFWhNrDt3wpO
         FxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h6CG2bMQTbzoeKiCNTYjo7P9Il/mWVmgFb8ULia79oo=;
        b=Gxm5raoZXNuI4otxGsYTPdQV/0Bf+PxlXjktZTsX4rDg5QOnrFNXvetQ+qfRXYA2n/
         g/6t0KR8um9GvxJ9f1xIdPLVQe+XPZ0yDz1v6X3cQIQC7amSgaoRjdl8ACRtcFZDnzsF
         vbAwcF7x5hsHh6TJSB6vzqpzV0JPbLSsl9ovXlmBb/l6KmeyX61Yho+vNTwo0SrhUZ8q
         74EtW/SXoQIAZf3zvsfgo1Dgm4P4Il+AiZgNIYAtX8InLom6wngwCr6TmP2y/k6qmRT9
         O442k8hXPl4XtHLFMMlKOIynuX1FU/ifw6LQ2SBe2g00PGaMynGEWSGZMlEf5QS8u7Lz
         iMAQ==
X-Gm-Message-State: AOAM530iuMll5mnkvQXqSp49GOU3SF/uv4zZO6NGqUrpEsPUWUf21E2B
        AUH1SghsvKg6u8JwOk47lMA=
X-Google-Smtp-Source: ABdhPJzLHRV2yytEQkLzu/K5A9ErmC8MtuEAatyPW9JfnHku3sG0kejkTmYQ8lPdcs1invl5PfrF/Q==
X-Received: by 2002:a63:5118:: with SMTP id f24mr18035389pgb.34.1623076222927;
        Mon, 07 Jun 2021 07:30:22 -0700 (PDT)
Received: from localhost (185.212.56.112.16clouds.com. [185.212.56.112])
        by smtp.gmail.com with ESMTPSA id e21sm12592504pjh.55.2021.06.07.07.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 07:30:22 -0700 (PDT)
Date:   Mon, 7 Jun 2021 22:30:20 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     helgaas@kernel.org, corbet@lwn.net, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, rric@kernel.org,
        bhelgaas@google.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] Introduce pcim_alloc_irq_vectors()
Message-ID: <20210607143020.GB821146@nuc8i5>
References: <20210606070511.778487-1-zhengdejin5@gmail.com>
 <YL3iQMNTcQrA3okH@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL3iQMNTcQrA3okH@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 07, 2021 at 12:09:20PM +0300, Andy Shevchenko wrote:
> On Sun, Jun 06, 2021 at 03:05:07PM +0800, Dejin Zheng wrote:
> > Introduce pcim_alloc_irq_vectors(), a device-managed version of
> > pci_alloc_irq_vectors(), In some i2c drivers, If pcim_enable_device()
> > has been called before, then pci_alloc_irq_vectors() is actually a
> > device-managed function. It is used as a device-managed function, So
> > replace it with pcim_alloc_irq_vectors().
> 
> Thanks!
> 
> > Changelog
> > ---------
> > v5 -> v6:
> > 	- rebase to 5.13-rc4
> 
> It's already rc5 and I believe you better use the subsystem tree against which
> your series is (i.e. PCI for-next or how it is called there).
>

Andy, Thanks for your reminder, I will use PCI for-next branch for new patch
version.

BR,
Dejin
> Besides that kbuild bot is not happy.
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
