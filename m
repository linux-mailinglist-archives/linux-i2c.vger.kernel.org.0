Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBC401FEF0C
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jun 2020 11:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbgFRJxG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Jun 2020 05:53:06 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:20046 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgFRJxF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Jun 2020 05:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592473984;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:Reply-To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=0F0J9ImJgd+Q8wPfoHyWSdYw6rGbC+qPn6R0ITa5fKE=;
        b=NwSV5LOsc4H3+hcL9eKWeE9/CTZI13nPRHRLtIZv+4cFy1ruqNqKP7jhdDFzi7YkTo
        LGxLzGvpwhJXFEu4jS1TcdJWoEvyvgbyKFb2IRANa2UcMIjQVEtV/ENbrHqGv1tSaW3O
        YSjU6gUKtETE8vRrzdNRoT8Qqr49Id4xXN6sngL1rA8Ru9psg+rN73WYspeYbuvZmX73
        qzGEL3OpT9tIzGCNiVsChVcpDHyQJGH9zqlU8fNvCdOQvBPJiIcXgAVSr0OwYWRnT73D
        t0qJHyEojQ3hl4z8gwXxDBLws8PXfYRSVDbgBdzZjdQ9IaK3OYoDd26arwn+YEHqRzCp
        bneA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCt/7N+Odk="
X-RZG-CLASS-ID: mo00
Received: from oxapp04-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 46.10.4 AUTH)
        with ESMTPSA id a0ab6bw5I9r2N6v
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 18 Jun 2020 11:53:02 +0200 (CEST)
Date:   Thu, 18 Jun 2020 11:53:02 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
Reply-To: Ulrich Hecht <uli@fpond.eu>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        "geert@linux-m68k.org" <geert@linux-m68k.org>
Message-ID: <1116823047.715027.1592473982407@webmail.strato.com>
In-Reply-To: <20200614093131.GD2878@kunai>
References: <1591817591-852-1-git-send-email-uli+renesas@fpond.eu>
 <20200614093131.GD2878@kunai>
Subject: Re: [PATCH] i2c: sh_mobile: implement atomic transfers
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.2-Rev27
X-Originating-Client: open-xchange-appsuite
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thank you for the review.

> On June 14, 2020 11:31 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > -	pm_runtime_get_sync(pd->dev);
> > +	if (!pd->atomic_xfer)
> > +		pm_runtime_get_sync(pd->dev);
> 
> This was a small surprise to me. I assume RPM is disabled that late?
> But can we be sure the clock is on, then?

Turns out it's unnecessary to mess with PM handling here. I assumed that it must not be touched during atomic transfers, but that seems not to be the case. I'll drop that bit in the next revision.

CU
Uli
