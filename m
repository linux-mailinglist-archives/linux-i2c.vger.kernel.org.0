Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA1323BE8
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 17:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388099AbfETPUT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 11:20:19 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:41669 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388065AbfETPUS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 May 2019 11:20:18 -0400
Received: by mail-ua1-f67.google.com with SMTP id l14so649387uah.8
        for <linux-i2c@vger.kernel.org>; Mon, 20 May 2019 08:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yPkishA3no+/g/FV605XOJKWtbVRtxVgWtFS2JQZ9bI=;
        b=Kxtt3uvgicFdIlOHphmgzeg6qcwksSg5x8b5fBlKAUoEtJbeq4uW+PNn4F5YAmMzyr
         uqFFhbY+un+kGiRRgCgL8MghZdTl4kLYe1ufn/CfBNiWyoYHwrRGgMA09rA6e9ix2WMk
         9sEpQr8fsWkqi7WNU3NXS9rylbV39+uq3sCw3ZpuGTkms4ijpxsGjO6FyoWtt5OL26EV
         RmgW9ZjVg/r34Cpggv32pOk/8Kik6hQliDvpmui4EcqGKnrIJvH/MCa3VX2Caz4uq/54
         4WGxty5+Ktsb3Z/m30o44gwsWigfGOM1GAh9Sg1WWp3W3R9KO+sG0qNvKHkLME5eVU8M
         MpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yPkishA3no+/g/FV605XOJKWtbVRtxVgWtFS2JQZ9bI=;
        b=dpxneFTG3Fgh8HFuUfkULSzaBjlAbYQuqBDxWBZ7aCbERHGCjvhWJZtSxjub30Lj4I
         eCgij3IpuPlRSg5c2nQyCWtVlVBVTWqhbKCy2GdzcQnwONuEjtfaq01VUBHpGc5UPz3C
         8Ji4YjNEzRJgvmgnIGeM2FWiTBNaigb1zIBn2uSNhm0u9/Yi7dEU+V8kcc9V2QnkfOhM
         ILMuo+PCiLfjxOBQxYyamaxhBjJcIxjqa+LNlKgaKChiBlXIY+0MT5Wwm3l9x0tWK6TK
         Dt4mugdippWD84q0sqS8l2xIBlQvzQIsOUIuMTAl9zUmcEQRzHPak6kv0UulMGVpJb66
         bnZQ==
X-Gm-Message-State: APjAAAU6oOKfZISb9kAhmuIm+OrxSh92VqB8a2AQuQfBFVZ/+r2MYUxc
        ntw+Sap78/3pIJbRpxpRdJ17hied0rPi0B7w/+GTZw==
X-Google-Smtp-Source: APXvYqyUiE88Q5DbYY6MW6gAUlfOMNSWJ4PSpYDD0G5KebJp1+15Ue04rR+q2oWWqyNgk8/ayaSUM7mZwfLYVH9RSRs=
X-Received: by 2002:a9f:2b0c:: with SMTP id p12mr28323739uaj.143.1558365617913;
 Mon, 20 May 2019 08:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <1558361478-4381-1-git-send-email-sagar.kadam@sifive.com>
 <1558361478-4381-4-git-send-email-sagar.kadam@sifive.com> <20190520145216.GD22024@lunn.ch>
In-Reply-To: <20190520145216.GD22024@lunn.ch>
From:   Sagar Kadam <sagar.kadam@sifive.com>
Date:   Mon, 20 May 2019 20:50:06 +0530
Message-ID: <CAARK3HnG4qg64cc_fjffxGp5EVTLdmWdkMVDx3YvK=coGAuqHw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] i2c-ocores: sifive: add polling mode workaround
 for FU540-C000 SoC.
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        Palmer Dabbelt <palmer@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 20, 2019 at 8:22 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, May 20, 2019 at 07:41:18PM +0530, Sagar Shrikant Kadam wrote:
> > The i2c-ocore driver already has a polling mode interface.But it needs
> > a workaround for FU540 Chipset on HiFive unleashed board (RevA00).
> > There is an erratum in FU540 chip that prevents interrupt driven i2c
> > transfers from working, and also the I2C controller's interrupt bit
> > cannot be cleared if set, due to this the existing i2c polling mode
> > interface added in mainline earlier doesn't work, and CPU stall's
> > infinitely, when-ever i2c transfer is initiated.
> >
> > Ref:previous polling mode support in mainline
> >
> >       commit 69c8c0c0efa8 ("i2c: ocores: add polling interface")
> >
> > The workaround / fix under OCORES_FLAG_BROKEN_IRQ is particularly for
> > FU540-COOO SoC.
> >
> > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
>
> Much better, thanks.
My pleasure Andrew.
Appreciate your timely review and response.

>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>
>     Andrew

Thanks,
Sagar
