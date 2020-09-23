Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A74A8275095
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 08:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgIWGCe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 02:02:34 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40394 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgIWGCe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Sep 2020 02:02:34 -0400
Received: by mail-pg1-f193.google.com with SMTP id k133so8958808pgc.7;
        Tue, 22 Sep 2020 23:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ha3VgyENu2LPnU4f1A3oqsIg+lYCf7TaXiKbXhQt3Ik=;
        b=UqF0vpz1a6rAGHjVbwwfK8DiJwKxd/fKlaWgRASaWmCrwfvH4jKLYd32wiJsCOHEcx
         XHJn9SCyfzq5bLXu1l5ET4W8twVx2bOYKnrN42krP7J/OEfaPn0TR+cjCzamjGZzt0DD
         AsV8Bq/4rzj3ykHOj6bkwcRa3O5SUWAqvQRmHw9emhR/0h4haRQoSu9R5jYJQV4kTdOO
         mmeg70l38c0JMo2R+c+GEymdd/WL/zBF6/1XUCuZ9V60bPTMrkyIcBuezd8THs2lCVnW
         JvoUTN1SkSuQIS14O6ijztX9P7arem2H2257JANlk3JwkPmI0knhy9BN/iqydXuWZ8wC
         xaUg==
X-Gm-Message-State: AOAM5328U+uHDStouCwQY3SdP36DTjnt6T9hlTnXSqlBZ5HVGlK2qiWW
        qXCJE+4lblbus/vc6oP9Asc=
X-Google-Smtp-Source: ABdhPJzdVWj4XNg5O2lI84ywNTWglHvxl/eykGJ8JHab6N1wy7LLoGa28Sw3gOkGY/BztnBQugk+tw==
X-Received: by 2002:a63:4e0a:: with SMTP id c10mr6306841pgb.369.1600840953864;
        Tue, 22 Sep 2020 23:02:33 -0700 (PDT)
Received: from sultan-box.localdomain ([104.200.129.212])
        by smtp.gmail.com with ESMTPSA id w6sm17114601pgf.72.2020.09.22.23.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 23:02:32 -0700 (PDT)
Date:   Tue, 22 Sep 2020 23:02:28 -0700
From:   Sultan Alsawaf <sultan@kerneltoast.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com,
        jarkko.nikula@linux.intel.com, kai.heng.feng@canonical.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, vicamo.yang@canonical.com
Subject: Re: [PATCH v2 0/4] i2c-hid: Save power by reducing i2c xfers with
 block reads
Message-ID: <20200923060228.GA1515@sultan-box.localdomain>
References: <20200917052256.5770-1-sultan@kerneltoast.com>
 <nycvar.YFH.7.76.2009221118150.3336@cbobk.fhfr.pm>
 <20200922113646.GA6731@ninjato>
 <nycvar.YFH.7.76.2009222159170.3336@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2009222159170.3336@cbobk.fhfr.pm>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 22, 2020 at 09:59:44PM +0200, Jiri Kosina wrote:
> On Tue, 22 Sep 2020, Wolfram Sang wrote:
> 
> > > Hans, Benjamin, could you please give this patchset some smoke-testing? It 
> > > looks good to me, but I'd like it to get some testing from your testing 
> > > machinery before merging.
> > 
> > Please give me some more days. I am not fully convinced yet that this
> > use of I2C_M_RECV_LEN is not broken on some controllers.
> > 
> > Plus, I'd favor if this could go via I2C tree. It is within I2C where
> > the non-trivial changes are. The HID part is just the final bit. Can we
> > agree on that?
> 
> Absolutely no problem with that. But I'd like to have this ran through 
> Benjamin/Hans first too.
> 
> Thanks,
> 
> -- 
> Jiri Kosina
> SUSE Labs
> 

I suppose the HID part does need to be held off until all the adapters are
updated with functional I2C_M_RECV_LEN bits.

I just got a Ryzen laptop which panics when using I2C_M_RECV_LEN.

So it looks like only the designware changes can be considered for merging now.

Sultan
