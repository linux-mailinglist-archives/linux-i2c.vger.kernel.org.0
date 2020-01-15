Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4007E13CD92
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 20:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729634AbgAOT5J convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 15 Jan 2020 14:57:09 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:46984 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgAOT5I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jan 2020 14:57:08 -0500
Received: by mail-ed1-f68.google.com with SMTP id m8so16685520edi.13;
        Wed, 15 Jan 2020 11:57:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=jDNwCuolitAgDOrIDNPnw09f7iD4pjQDMUepa+LBBOA=;
        b=i3VUDjolXRmMH0mJ+mEpnT5PuZoxPwTz8Q9+Hkp4mfD29H7q/sviiKs8JF1C7RREnb
         /bLWD20X0IOEVFrc2vbV3sz7G0aaa65HQmTgs985KeNUpB3g0C1WIK+6nQahSdrxx7YP
         VtOosfgHcpdER1mT+tRIEivbRgribxw/MikXwTrzL3PH7AUV95iHZfD/rJkdpCWn0B7j
         rqJrk/rJWXJ525PXgShsXWuUQeqUjtrx+yjlGOq911cWVtVPPI4gb5MAmzHiAR+qG5xR
         nc9aiPRsMed76QHNrKkKZ5pBl57YZTjgr1q/AgmrBPsgW1HGa8Z7AUSEoNyusOKNEUf6
         J5/w==
X-Gm-Message-State: APjAAAXm/w53dpnozPV0sxgGK4lOaFg1rziUU77N1IqbFZi3lm6/mvnK
        iCGCzLqsCA5B+nwhC/Bcb5M=
X-Google-Smtp-Source: APXvYqywuJ3PR2OFKAoXjeJUN74qmwV/eBqYi90GLh6TA1Yppc7IIV33SnL1hPunPOgNaMuj/qGLCQ==
X-Received: by 2002:a17:906:b212:: with SMTP id p18mr30068484ejz.208.1579118227369;
        Wed, 15 Jan 2020 11:57:07 -0800 (PST)
Received: from kozik-lap ([194.230.155.229])
        by smtp.googlemail.com with ESMTPSA id u29sm755644edb.22.2020.01.15.11.57.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 11:57:06 -0800 (PST)
Date:   Wed, 15 Jan 2020 20:57:04 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH v2 3/4] i2c: highlander: Use proper printk format for
 iomem pointer
Message-ID: <20200115195704.GB8661@kozik-lap>
References: <1578992765-1418-1-git-send-email-krzk@kernel.org>
 <1578992765-1418-3-git-send-email-krzk@kernel.org>
 <20200115174337.GH1239@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200115174337.GH1239@ninjato>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 15, 2020 at 06:43:37PM +0100, Wolfram Sang wrote:
> On Tue, Jan 14, 2020 at 10:06:04AM +0100, Krzysztof Kozlowski wrote:
> > iomem pointers should be printed with pointer format to hide the
> > actual value and fix warnings when compiling on 64-bit platform (e.g. with
> > COMPILE_TEST):
> > 
> >     drivers/i2c/busses/i2c-highlander.c: In function ‘highlander_i2c_smbus_xfer’:
> >     drivers/i2c/busses/i2c-highlander.c:325:22: warning:
> >         format ‘%d’ expects argument of type ‘int’,
> >         but argument 3 has type ‘size_t {aka long unsigned int}’ [-Wformat=]
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Wrong commit message. buf_len is size_t and not an iomem pointer.

I'll fix it up.

Best regards,
Krzysztof

