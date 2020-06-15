Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4209A1F9C82
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 18:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730621AbgFOQD0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 12:03:26 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39775 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730426AbgFOQD0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Jun 2020 12:03:26 -0400
Received: by mail-pl1-f195.google.com with SMTP id v24so6974657plo.6;
        Mon, 15 Jun 2020 09:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K9MJT+eXnXmz1ilMAGWESoX9j8zjIESdzer9fDMdlfI=;
        b=cnvBOS58obQFCcH0svIWTkTF3n7duV49F099UQgUDNgD7wZeSotdeh3bsW2yfXux+/
         n02GHFZsHFay4091P1FsVlwlTYExAnpbxu4jz6alQj3oI2HoftHue2Xjil0KlhBlMXuz
         Ajl1IZ3UQTY1Sh0nHxrPSLilM1YLlysqDO3A7HLgroiEAv/ppGC4vfpL+DYyQWIDxpfF
         I8bQLAsIhyjZ7Wx4VNM+2lxp8lYl2Q4T4mgPSZhxiqZeqb90C677J5vClEmVP8c4lmlj
         j1qcyd41sZq8mokA/SxU+U8Azdv1wa+5j0ZkEaie4ZpvDnqd8fGRt9K5KigIb5rLgSPC
         bFvQ==
X-Gm-Message-State: AOAM533dva9vCocLrNSCLSKxezpnMoIOBwUGRW840oKdlVaEm6Wmv0BN
        Bxli/1Iqfndmm77cZqjSjNo=
X-Google-Smtp-Source: ABdhPJxRfiCHIUq/13ST4nV77vvKmMnLt0PEBynbU/VZoK99G+FIGqFisGJEiecnHS90xszsCOypcg==
X-Received: by 2002:a17:90b:28d:: with SMTP id az13mr7410pjb.67.1592237005503;
        Mon, 15 Jun 2020 09:03:25 -0700 (PDT)
Received: from sultan-book.localdomain ([89.45.90.111])
        by smtp.gmail.com with ESMTPSA id i22sm14181344pfo.92.2020.06.15.09.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 09:03:24 -0700 (PDT)
Date:   Mon, 15 Jun 2020 09:03:20 -0700
From:   Sultan Alsawaf <sultan@kerneltoast.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Aaron Ma <aaron.ma@canonical.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Pavel Balan <admin@kryma.net>, Tin Huynh <tnhuynh@apm.com>,
        Wolfram Sang <wsa@kernel.org>,
        You-Sheng Yang <vicamo.yang@canonical.com>
Subject: Re: [PATCH 1/2] i2c: designware: Only check the first byte for SMBus
 block read length
Message-ID: <20200615160320.GA1949@sultan-book.localdomain>
References: <20200614210255.4641-1-sultan@kerneltoast.com>
 <20200614210255.4641-2-sultan@kerneltoast.com>
 <20200615094019.GP2428291@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615094019.GP2428291@smile.fi.intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 15, 2020 at 12:40:19PM +0300, Andy Shevchenko wrote:
> On Sun, Jun 14, 2020 at 02:02:54PM -0700, Sultan Alsawaf wrote:
> > From: Sultan Alsawaf <sultan@kerneltoast.com>
> > 
> > SMBus block reads can be broken because the read function will just skip
> > over bytes it doesn't like until reaching a byte that conforms to the
> > length restrictions for block reads. This is problematic when it isn't
> > known if the incoming payload is indeed a conforming block read.
> > 
> > According to the SMBus specification, block reads will only send the
> > payload length in the first byte, so we can fix this by only considering
> > the first byte in a sequence for block read length purposes.
> 
> I'm wondering if this overlaps with [1]. AFAIU that one is also makes sure that
> the length is not a garbage.
> 
> [1]: https://lore.kernel.org/linux-i2c/20200613104109.2989-1-mans@mansr.com/T/#u

No overlap. That looks like a similar bug for a different driver. In my case,
the adapter provides native SMBus support, so emulation is never used. This is
clear to see by looking at i2c_transfer_buffer_flags(), which only uses the
master_xfer functions provided by the adapter; it doesn't call the emulation
path at all.

Sultan
