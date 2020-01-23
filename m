Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 970E81464A3
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 10:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgAWJbZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 04:31:25 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40163 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgAWJbZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jan 2020 04:31:25 -0500
Received: by mail-ed1-f67.google.com with SMTP id b8so2623527edx.7;
        Thu, 23 Jan 2020 01:31:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R1J6FCR4iw6F143Mrog9ddQTJ4O+wJBhPa0ux9+3yY8=;
        b=gKAQ9JZMovlAj3iP6osQEIVZ2avjqvUKah4ci/iMjQRKtRZnm9fkONSX/sTiUs8GMl
         aYtXc9W3ubKAwffxeD/pZlljQjyn9MECKZSbz75N1I5n1KJKUTx2u2Mqji12sZnPhZ/q
         YthQQ+CSFswOnceTmRDHKUh8pJYYmHy4cO6id3v7b28SShk8sa/GDS8E8riCH24MJZK/
         pAmz/8EywYQmVmcaog0gEns3nZoFOWKluhK46G/W73gRfITsPNYLbczFwXe8AXqq/uU3
         YYm2udyPacxAytS8j9gdwk4wxfjqptfo6VsKtzhRwHcDk99PnZylYBVcXFQs/BVijMnW
         Hh2w==
X-Gm-Message-State: APjAAAWmxp/IwShOOwJHZ3wlgOV0JMsAwK7nuLC5FovsKqOWAwuT2YIH
        Mu0Xaj3eLm0VUV226w45qoKfWbh92VU=
X-Google-Smtp-Source: APXvYqwidU7GWgMJb55gz0w+PLoJyZZqodHUu04xJ43Vh76V+omwmhwQwEgK/DA64YUcFlx9Aen1fQ==
X-Received: by 2002:a05:6402:30b7:: with SMTP id df23mr6178248edb.325.1579771883413;
        Thu, 23 Jan 2020 01:31:23 -0800 (PST)
Received: from pi3 ([194.230.155.229])
        by smtp.googlemail.com with ESMTPSA id dx7sm48267ejb.81.2020.01.23.01.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 01:31:22 -0800 (PST)
Date:   Thu, 23 Jan 2020 10:31:20 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg KH <greg@kroah.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] i2c: Enable compile testing for some of drivers
Message-ID: <20200123093120.GA2365@pi3>
References: <1578384779-15487-1-git-send-email-krzk@kernel.org>
 <20200123091228.GB1105@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200123091228.GB1105@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 23, 2020 at 10:12:28AM +0100, Wolfram Sang wrote:
> 
> >  config I2C_ZX2967
> >  	tristate "ZTE ZX2967 I2C support"
> > -	depends on ARCH_ZX
> > -	default y
> > +	depends on ARCH_ZX || (COMPILE_TEST && (ARC || ARM || ARM64 || M68K || RISCV || SUPERH || SPARC))
> > +	# COMPILE_TEST needs architectures with readsX()/writesX() primitives
> 
> The list of archs neither looks pretty nor very maintainable. My
> suggestion is that we leave this out of COMPILE_TEST until we have
> something like ARCH_HAS_READS or something. What do you think?

Indeed it does not look good. However having compile testing allows
kbuild to run sparse and smatch which already started pointing minor
issues in existing drivers.

Yeah... pros and cons... I don't have a strong opinion to keep it. Since
patch is important, maybe let's just skip this part?

Best regards,
Krzysztof
