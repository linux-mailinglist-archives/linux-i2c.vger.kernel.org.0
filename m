Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B00202CBFDB
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 15:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730231AbgLBOfx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 09:35:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:43364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730230AbgLBOfx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 09:35:53 -0500
Date:   Wed, 2 Dec 2020 15:35:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606919712;
        bh=BM5X6trzy2cnI16+Ftn+8bmS4XkFo/RJumCk8Icr5c8=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q7aR1MI11nzjjJfXH+lgF0YvwSJLOdSvfIktiHlZJg5rCxH2v/jqFi9I4xf0xr/8W
         MwtpP5r0Nq/AIHdG69FYqLpmzvl219+n6dfW2jcHpbUDv/qZFuHtqWVXbePtkNPoqR
         8OAXYDqYowiBP5nyOjdmXAGLwUb3NmT0+9bpKzwQ=
From:   Wolfram Sang <wsa@kernel.org>
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     Dhananjay Phadke <dphadke@linux.microsoft.com>,
        Ray Jui <ray.jui@broadcom.com>,
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
Message-ID: <20201202143505.GA874@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>,
        Ray Jui <ray.jui@broadcom.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
References: <38a23afc-57da-a01f-286c-15f8b3d61705@broadcom.com>
 <1605316659-3422-1-git-send-email-dphadke@linux.microsoft.com>
 <CAHO=5PFzd9KTR93ntUvAX5dqzxqJQpVXEirs5uoXdvcnZ7hL4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAHO=5PFzd9KTR93ntUvAX5dqzxqJQpVXEirs5uoXdvcnZ7hL4g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> All review comments are scattered now, please let me know what has to be
> done further,
> Are we going to change the tasklet to irq thread ?
> Are we going to remove batching 64 packets if transaction > 64B and use rx
> fifo threshold ?
>=20
> I don't see any issue with current code but if it has to change we need a
> valid reason for the same.
> If nothing to be done, please acknowledge the patch.

Valid request. Has there been any news?

