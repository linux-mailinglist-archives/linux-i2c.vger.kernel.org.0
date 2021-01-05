Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8F22EAFF4
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 17:24:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbhAEQWb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 11:22:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:39640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725880AbhAEQWb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Jan 2021 11:22:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B56B922D04;
        Tue,  5 Jan 2021 16:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609863711;
        bh=/AduAAI4tZbebeHCUJOPRqAxhsYnZgNeDS2PrMgEiD0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XYVwTxZ7gcoAgro9GbsM2i62gt2JgDU/jjDAJSMqqD5ZLNsEKTEDXh0DevrHgnTIk
         LaOYfyrm38BSv4/gARhxNdGXJpj+1hInCvz0r6kM7Mwd4WSkJbWaG0BsiRfwn7oFjE
         XFg3xx188EI05IyiSW1O35hciv/AzHTVyTb0bZvsAGr5ZH0eWMn4RRX4dQaV1QPg96
         7sUTGqYOSMnEFpQ4iYYDOKDNzIQbV50jiS+6D+w3Q3vORuCDFQYLmULB4KWKzQYdPv
         xIxgdYPT6mpsjo5jdE4vmmw4fRCctij/PoCjisD65zJhP6eLy1YvNDcXF85A+qKspu
         kpGDvPhz4bgIw==
Date:   Tue, 5 Jan 2021 17:21:45 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     Ray Jui <ray.jui@broadcom.com>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Subject: Re: [PATCH v3 5/6] i2c: iproc: handle master read request
Message-ID: <20210105162145.GG1842@ninjato>
References: <38a23afc-57da-a01f-286c-15f8b3d61705@broadcom.com>
 <1605316659-3422-1-git-send-email-dphadke@linux.microsoft.com>
 <CAHO=5PFzd9KTR93ntUvAX5dqzxqJQpVXEirs5uoXdvcnZ7hL4g@mail.gmail.com>
 <20201202143505.GA874@kunai>
 <23a2f2e8-06ad-c728-98eb-91b164572ba4@broadcom.com>
 <CAHO=5PE=BRADou_Hn8qP3mgWiSwDezPCxDjuqa0v1MxMOJRyHQ@mail.gmail.com>
 <35541129-df37-fa6f-5dae-34eb34a78731@broadcom.com>
 <CAHO=5PFCsWQb7nv5Sg00DAX6XXTfV7V8BH-ithK-Scq8eFFVbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAHO=5PFCsWQb7nv5Sg00DAX6XXTfV7V8BH-ithK-Scq8eFFVbA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> > I think that makes sense, and I'm okay with these patches going in as
> > they are now.
> >
> > Acked-by: Ray Jui <ray.jui@broadcom.com>
>=20
> Thank you.

Yes, thank you everyone.

All applied to for-next, thanks!

> --=20
> This electronic communication and the information and any files transmitt=
ed=20
> with it, or attached to it, are confidential and are intended solely for=
=20
=2E..

Please remove this paragraph for mailing lists.

