Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE9C13CD78
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 20:52:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729485AbgAOTwC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 14:52:02 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39509 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbgAOTwB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jan 2020 14:52:01 -0500
Received: by mail-ed1-f65.google.com with SMTP id t17so16680884eds.6;
        Wed, 15 Jan 2020 11:52:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aHd50RCmkVU/ZS/HxtfzC0g4zmJOst7WpqvtTeB8dwQ=;
        b=JRtQjebV1XuPND6/OQUpTB5OCOco5o6BMMxxe3cGAHp+9T8/xN+lkrePaMjP28O37/
         AvEDzf0WD4i9yuiAcMuKCR0ac3LOQZ/q+ducBdFRmUN53Kr9Jj9438cb3bMBa/02g4VW
         OI81Iw9sbr8BAfVfBwS8lRhl4Y2GB0D7OXLLOSJZDTNK0lOsdqaqEKgjzR7ppSTlAtHB
         9Pq8U1A13i6CrvWZkogovC6PL2zA+rmgkxfpZeS96wt4F3GDk1fGgN+olXeBtgl6uBzM
         zQeazAbACRU276mQqOW2S/OsNcrgFmUvHgtwNx+v6RMvBQ0Oi2wE9JkzMB3xCJjNkIXS
         27ZQ==
X-Gm-Message-State: APjAAAVYj019168MwilqmvoAvyJpPENg0XToPPfu5n2agLnleBEFGN33
        jorpXIfkzq+ctSfaaP9Tm1Y=
X-Google-Smtp-Source: APXvYqwe+/d6KcpGCa37Qjgf5sHzR3xo/URPMNvfsudTgB/tmaCyZ/Ctbk+unVAtHKq+h/sEPaRNag==
X-Received: by 2002:a05:6402:298:: with SMTP id l24mr32222230edv.70.1579117919881;
        Wed, 15 Jan 2020 11:51:59 -0800 (PST)
Received: from kozik-lap ([194.230.155.229])
        by smtp.googlemail.com with ESMTPSA id j63sm756813edd.81.2020.01.15.11.51.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 11:51:59 -0800 (PST)
Date:   Wed, 15 Jan 2020 20:51:57 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH v2 1/4] i2c: pmcmsp: Use proper printk format for
 resource_size_t
Message-ID: <20200115195157.GA8661@kozik-lap>
References: <1578992765-1418-1-git-send-email-krzk@kernel.org>
 <20200115174553.GI1239@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200115174553.GI1239@ninjato>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 15, 2020 at 06:45:53PM +0100, Wolfram Sang wrote:
> 
> > +			"Unable to get memory/io address region %pap\n",
> > +			&(res->start));
> 
> My first thought was "parens not needed"; not because I like being picky
> but because it doesn't look more readable to me.
> 
> checkpatch agrees:
> 
> CHECK: Unnecessary parentheses around res->start
> #30: FILE: drivers/i2c/busses/i2c-pmcmsp.c:278:
> +			&(res->start));

Indeed... let me send v3.

Best regards,
Krzysztof

