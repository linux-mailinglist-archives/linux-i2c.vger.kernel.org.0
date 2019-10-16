Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD48AD99E3
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2019 21:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403807AbfJPTUl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Oct 2019 15:20:41 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36044 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403806AbfJPTUl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Oct 2019 15:20:41 -0400
Received: by mail-pg1-f196.google.com with SMTP id 23so14871669pgk.3
        for <linux-i2c@vger.kernel.org>; Wed, 16 Oct 2019 12:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nkjcBI/sR0pHQa7Q6ZwYOj6wNZTv9s5BqUzK5l7ttQg=;
        b=rdImgBV5rSX819CWsaELSfHqCFtbKBlCgDcC1RDvmhUH4cxrZllIk9JJ4A3ft2cndE
         VEW0TUE7aluFb5sGutlpLF2zLOxMvSjZwYBpPZtUjPS91c1gOcqbTdlVsLDBKyZzpSWr
         N6IBsIPY8HYN5UsQs0atjxR9M+89To10Rks6ATMcWvWv8du5xxvXx79yxrzCY5rbCd6N
         X1aNnwHNB6nVARAEp7XKbKHn/2myhZkH1jy8CwLaM36qFh9YNuxoOTcz5Dz2QJBILuA3
         p93/vdRHF7+ABcOD8H8+CGE+/YqpYaOxrSkiHdYXsVxtuzBjBdn2WRPevotJpnYSBGeg
         ItaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nkjcBI/sR0pHQa7Q6ZwYOj6wNZTv9s5BqUzK5l7ttQg=;
        b=roGWx2M6LHLWuJNr4MOuk5wfwDkVZL9v+DS7wjj/wbsfuuXXfb9QozRCXBZdY0kvPX
         pglwAn92KdQ3g9h08M1KF/XNIoEceytaQlnm6GyfGiYplkQyc8G1uZxLwzvkb81NprUs
         jvtOHYV5euttRhgb+HNONa2/6+4NJSvQWcEG376VksLn8455OqVI3OzN53PDOF9mweqZ
         E0bdwNNxXtqDaUn3HjkCk+/6OQd4LudRieTgD1sCx+4FldMDg80vF0sJ4MN/hN8n82YW
         jQGVbtu61+c8nnCNEHxKgzCUwzh6pY31j3fs6AmZzTcijW4+NUxWPXVZICPhvq9yvgxa
         xpIA==
X-Gm-Message-State: APjAAAVuf5yzgEb12zQX5PEhq+ZbV1kBlRRNbE8MPULKPN8oo7Dh6AuT
        ro6mUqA/yMiT2NshMvlwYg6bDP4oLtSqYpI7GpmeLQ==
X-Google-Smtp-Source: APXvYqwoWZoU1NQcYrpdH/oqoCAqIzIKZ/BPjYCIHumscCSMLtnNlqQsKoIXYT9B0G5ZK//ak2ZZhT8vfvalCP74+kc=
X-Received: by 2002:a17:90a:2451:: with SMTP id h75mr7096361pje.131.1571253639855;
 Wed, 16 Oct 2019 12:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
 <49244d71-cbc3-f2ae-97ac-74b5f68a4816@fb.com> <4ca4083d-23ff-0475-f5fd-ec3745b440b2@linux.intel.com>
In-Reply-To: <4ca4083d-23ff-0475-f5fd-ec3745b440b2@linux.intel.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 16 Oct 2019 12:20:28 -0700
Message-ID: <CAFd5g47NL79YkVi4nJk63-ZbFXAKW+x1xWFoa26zPpY1+QnUrQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: fix master pending state handling
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Tao Ren <taoren@fb.com>, Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Cedric Le Goater <clg@kaod.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 10, 2019 at 4:52 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> On 10/10/2019 4:29 PM, Tao Ren wrote:
> > On 10/9/19 2:20 PM, Jae Hyun Yoo wrote:
> >> In case of master pending state, it should not trigger a master
> >> command, otherwise data could be corrupted because this H/W shares
> >> the same data buffer for slave and master operations. It also means
> >> that H/W command queue handling is unreliable because of the buffer
> >> sharing issue. To fix this issue, it clears command queue if a
> >> master command is queued in pending state to use S/W solution
> >> instead of H/W command queue handling. Also, it refines restarting
> >> mechanism of the pending master command.
> >>
> >> Fixes: 2e57b7cebb98 ("i2c: aspeed: Add multi-master use case support")
> >> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> >
> > Tested-by: Tao Ren <taoren@fb.com>
> >
> > Tested the patch on Facebook Minipack BMC (multi-master i2c-0 environment) and
> > everything looks good to me.

Looks like we got the necessary tested-bys and reviewed-bys. Can we
apply this for next?
