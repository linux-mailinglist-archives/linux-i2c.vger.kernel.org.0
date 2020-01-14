Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1642213AC85
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2020 15:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbgANOmS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jan 2020 09:42:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:52732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727285AbgANOmR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Jan 2020 09:42:17 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 46E642467D;
        Tue, 14 Jan 2020 14:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579012936;
        bh=c6LDYtQqnB7DdTApZcqmNGiY6xvHi2T3M3/D6FiMHZ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GG71RzVGoQnmwIOM+Sjez36iAzpuKlEX/vL0U2OC8n9fVurxtuqYtE8Jbhii2w2wb
         qghMy7naE0sJOsomIhpEmM0Nf3jhKVZFKqBGDmUzIfkNDytSL0ec35H+dF76QS5Fht
         zjf4D6M+cmkYtt7ipHfr9fcMFynJnwVvLJNNHo+8=
Date:   Tue, 14 Jan 2020 15:42:14 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        baylibre-upstreaming@groups.io,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 4/5] dt-bindings: at25: add reference for the wp-gpios
 property
Message-ID: <20200114144214.GA1898224@kroah.com>
References: <20200107092922.18408-1-ktouil@baylibre.com>
 <20200107092922.18408-5-ktouil@baylibre.com>
 <20200108205447.GA16981@bogus>
 <CAMpxmJXffr-S51udNmUyMHz687jAoBKrYspNypfUUqjOD45zxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJXffr-S51udNmUyMHz687jAoBKrYspNypfUUqjOD45zxQ@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 09, 2020 at 10:47:56AM +0100, Bartosz Golaszewski wrote:
> śr., 8 sty 2020 o 21:54 Rob Herring <robh@kernel.org> napisał(a):
> >
> > On Tue,  7 Jan 2020 10:29:21 +0100, Khouloud Touil wrote:
> > > As the at25 uses the NVMEM subsystem, and the property is now being
> > > handled, adding reference for it in the device tree binding document,
> > > which allows to specify the GPIO line to which the write-protect pin
> > > is connected.
> > >
> > > Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
> > > ---
> > >  Documentation/devicetree/bindings/eeprom/at25.txt | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Hi Greg,
> 
> AT25 patches usually go through the char-misc tree. In this case
> however, the change depends on the other patches in this series. Can
> you ack this and I'll take it through the AT24 tree exceptionally?

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
