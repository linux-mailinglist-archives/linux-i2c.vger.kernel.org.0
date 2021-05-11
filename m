Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A52237AAC2
	for <lists+linux-i2c@lfdr.de>; Tue, 11 May 2021 17:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231690AbhEKPfA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 May 2021 11:35:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:33526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231609AbhEKPe7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 11 May 2021 11:34:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B017C6191C;
        Tue, 11 May 2021 15:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620747232;
        bh=0ycZJyo5rPknGQbcP1uAKYtdIN0dctFP9qaEHA1Lmtk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZjsrZAwbc/lBKJzT5Qnk9hhA7hlNe9/+wsYAaQ2hCTHDuuS714UHT6/PWDkPLtFVN
         PGNsYrLkQZQ1njQMFNmrF+rY39q/TgojalbAiTiTFUb8PZp5nbjHm2FQrAyGecNVnb
         EFjtdDxosV0WEHHZtJzjScukgd4H65tzu8ct8/DgkOWVpEXiQRX93jUgit8bPoBFw8
         4UaZJ8n36ZGgLFTGYdVNhCLgSUAdMe+PK32kf2pkJ+5uBrTdO+Lm2MfL5TkWLGYyuF
         UzXOSq495Yh6kMMp2pjKebGAlUkklNesbZGSBbHQ6dUDDZshlwFG4FA61TEF9kzj8H
         s2J+Xs12uTA1Q==
Received: by mail-qk1-f176.google.com with SMTP id 76so19114845qkn.13;
        Tue, 11 May 2021 08:33:52 -0700 (PDT)
X-Gm-Message-State: AOAM531i5nLTX5InfGMpwo1rUGeWyOyKyHeWQrLpkLuNcifHdLcedA5Z
        I08mCcw4lGzUvuJ5zWyZX8uM0ETDp4xHgr3I5A==
X-Google-Smtp-Source: ABdhPJzgBwoKu9MHPdLj91APOY8pzFmxS2DLOE3Q2ktzZ0fUiNWOhbcxKfUo1JHMW7OvuM894BUmNNo5VnEbhOJ8/vY=
X-Received: by 2002:a37:6116:: with SMTP id v22mr14616810qkb.464.1620747229748;
 Tue, 11 May 2021 08:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210507004047.4454-1-chris.packham@alliedtelesis.co.nz>
 <20210507004047.4454-2-chris.packham@alliedtelesis.co.nz> <20210507214936.GA2944698@robh.at.kernel.org>
 <c5d6f8d0-9b8a-b3bf-b7c3-884f03f7ecee@alliedtelesis.co.nz>
In-Reply-To: <c5d6f8d0-9b8a-b3bf-b7c3-884f03f7ecee@alliedtelesis.co.nz>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 11 May 2021 10:33:37 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKaeubNxYwGNOJYv=VcwR_6NzwkXnQ4DjOwXDudEmZ2Rg@mail.gmail.com>
Message-ID: <CAL_JsqKaeubNxYwGNOJYv=VcwR_6NzwkXnQ4DjOwXDudEmZ2Rg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: mpc: Add fsl,i2c-erratum-a004447 flag
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "wsa@kernel.org" <wsa@kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, May 9, 2021 at 4:08 PM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:
>
>
> On 8/05/21 9:49 am, Rob Herring wrote:
> > On Fri, May 07, 2021 at 12:40:45PM +1200, Chris Packham wrote:
> >> Document the fsl,i2c-erratum-a004447 flag which indicates the presence
> >> of an i2c erratum on some QorIQ SoCs.
> >>
> >> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> >> ---
> >>   Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> >> index 7b553d559c83..98c6fcf7bf26 100644
> >> --- a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> >> +++ b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> >> @@ -46,6 +46,13 @@ properties:
> >>       description: |
> >>         I2C bus timeout in microseconds
> >>
> >> +  fsl,i2c-erratum-a004447:
> >> +    $ref: /schemas/types.yaml#/definitions/flag
> >> +    description: |
> >> +      Indicates the presence of QorIQ erratum A-004447, which
> >> +      says that the standard i2c recovery scheme mechanism does
> >> +      not work and an alternate implementation is needed.
> > The problem with adding a property for an errata is you have to update
> > the dtb. If you use the compatible string, then only an OS update is
> > needed. That assumes you have specific enough compatible strings.
>
> I was following the style of the existing fsl,usb-erratum-a007792 or
> fsl,erratum-a008585 properties. But that's not really a compelling reason.
>
> The existing compatible string is "fsl-i2c" and it's used by pretty much
> every powerpc QorIQ SoC. There are some specific compatible strings in
> the driver for some of the older mpc SoCs. A more specific compatible
> string will work although determining which ones are affected might be a
> bit troublesome. That we know of the P2041 and P1010 are affected but I
> suspect there may be more. One disadvantage of using the compatible
> string is that as affected SoCs are identified we'll have to update the
> driver to know that SoC is affected and update the dtb to use it. With
> the property we'd just have to update the dtb.

If you don't have specific compatibles in the dtb already, then it's
mute as the point was to avoid the dtb update.

> I'm not too fussed either way so if that's a hard NACK on the property I
> can send a version that uses compatible strings instead.

Acked-by: Rob Herring <robh@kernel.org>

You could still add compatibles for the next time...
