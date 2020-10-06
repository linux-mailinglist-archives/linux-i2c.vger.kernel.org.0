Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C096284807
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Oct 2020 10:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgJFIC1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Oct 2020 04:02:27 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.23]:18187 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgJFIC1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Oct 2020 04:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1601971346;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=MHJ/AaYzurHr9F8plviGVBELLffgMer4Xh9xNz4R5VE=;
        b=NmCEaVzX3xGiXkjV0hmlvnbKoE+/OpkVlYFGYVhe/SndOnUa0LvY0JqjqSQd686iSn
        cSCWUQMlvKwo4zyru0C/M13/7UPnOUPNRiVmZT4zinE48SvTPzGnsSIkvknfcCHgOjy3
        DrO/u7nQBjpKmCQcTt7pz8Jifi5rZLzS7FByT0roWFc8oMUwJ2EyeK9j1QlxHBA+AU+D
        F0GZ/H1GMzj0D1NQZE4DXRNhDIHf9zC4yNvhDEyQ6elpOueQ4p25M2u9bREw0SMW0MVH
        EsLB9Q9hppriCaQuadXFqUjafBdrYiT9cqd/JFsdjgf4PEK3qce6CUxuFNr/nU15SWyg
        YQIw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCt/7B6PNk="
X-RZG-CLASS-ID: mo00
Received: from oxapp04-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 47.2.1 AUTH)
        with ESMTPSA id a056fbw967xL9ql
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 6 Oct 2020 09:59:21 +0200 (CEST)
Date:   Tue, 6 Oct 2020 09:59:21 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Message-ID: <1440786741.680679.1601971161395@webmail.strato.com>
In-Reply-To: <20201002154423.GA16758@ninjato>
References: <20200928155950.1185-1-uli+renesas@fpond.eu>
 <20201002154423.GA16758@ninjato>
Subject: Re: [PATCH v4] i2c: sh_mobile: implement atomic transfers
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev22
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> On 10/02/2020 5:44 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > +				if (sr & (ICSR_AL   | ICSR_TACK |
> > +					  ICSR_WAIT | ICSR_DTE)) {
> > +					sh_mobile_i2c_isr(0, pd);
> > +					udelay(150);
> > +				} else {
> 
> And where does the value 150us come from?

Anything more than (IIRC) 50us or so works, but I tried to be conservative. Not waiting at all does not work, though. It is not quite clear to me why, because the bits tested here are the conditions for an interrupt to be triggered.

CU
Uli
