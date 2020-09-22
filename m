Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DACC42749B0
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Sep 2020 21:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726577AbgIVT7u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 15:59:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:57072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgIVT7u (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 22 Sep 2020 15:59:50 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 250D6221E8;
        Tue, 22 Sep 2020 19:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600804789;
        bh=9hKEx0c62BVTx8Jprj2kG0CvGf0oLBx3Vphp8tDxFl0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=a0glveV8KOjNjV0gaRkagn2eu7ChZfJlNYdVLkddjH+t6O6yA9Sj3IK+vPhaxyXfx
         w0y2RXJCrjT7wYe4K4TS2tN0rFgCUg5iDT0kS914KNrN84y91MnEWUX3yy1jLIoQpZ
         EM3hlqy9uWQ5BYIrzJFWlxRNPQGLkeYJ7GOQW/pM=
Date:   Tue, 22 Sep 2020 21:59:44 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>
cc:     Sultan Alsawaf <sultan@kerneltoast.com>, linux-i2c@vger.kernel.org,
        aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com,
        jarkko.nikula@linux.intel.com, kai.heng.feng@canonical.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, vicamo.yang@canonical.com
Subject: Re: [PATCH v2 0/4] i2c-hid: Save power by reducing i2c xfers with
 block reads
In-Reply-To: <20200922113646.GA6731@ninjato>
Message-ID: <nycvar.YFH.7.76.2009222159170.3336@cbobk.fhfr.pm>
References: <20200917052256.5770-1-sultan@kerneltoast.com> <nycvar.YFH.7.76.2009221118150.3336@cbobk.fhfr.pm> <20200922113646.GA6731@ninjato>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 22 Sep 2020, Wolfram Sang wrote:

> > Hans, Benjamin, could you please give this patchset some smoke-testing? It 
> > looks good to me, but I'd like it to get some testing from your testing 
> > machinery before merging.
> 
> Please give me some more days. I am not fully convinced yet that this
> use of I2C_M_RECV_LEN is not broken on some controllers.
> 
> Plus, I'd favor if this could go via I2C tree. It is within I2C where
> the non-trivial changes are. The HID part is just the final bit. Can we
> agree on that?

Absolutely no problem with that. But I'd like to have this ran through 
Benjamin/Hans first too.

Thanks,

-- 
Jiri Kosina
SUSE Labs

