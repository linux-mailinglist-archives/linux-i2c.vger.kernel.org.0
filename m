Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65B6726E948
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Sep 2020 01:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgIQXMx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 19:12:53 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43086 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgIQXMw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 19:12:52 -0400
Received: by mail-pf1-f196.google.com with SMTP id f18so2182857pfa.10;
        Thu, 17 Sep 2020 16:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VvWE0vd6Z6cZqNOq/2evFZ4nZv2/3WPxT1Xp9nhMpCg=;
        b=W6PHbcJhW0Wn+uaAgZbbt6gDU0Qs9fixGFEvADwY4Hi2tuhPFR2N9rf1TvXCUE9/Os
         YfWUG9UnROqsxIGXTlB+uoMoR/qGD/X0TDCUxKoKQsacOqnTgx91HSlpVuDL8ebKaWX6
         tg+RUkBfWzmJYMrzGm698vYaefKgDMQ1laKrpkTpAJFZGneEbIiBMlUenMJohp1j7T5Y
         KBWJt7SOA+3PUuPCkmF+B4tRTktAz+uhGqsM2KlagUsMN95EbryRyn4sl4keF3WOksK7
         c2IDEHFCjLxr3VAMIbSqNhDagk5TTkDqI/fW3ABx+ejCYyOMSoNlWfB17c9pFflBExgw
         khQg==
X-Gm-Message-State: AOAM530BfmQ1uR7Ggs4POFexuJ6+uf+9ownQkOBCd5wCIA28fY/04L+f
        oo7lEgt2sx4Je1y2Et9R5Po=
X-Google-Smtp-Source: ABdhPJxt16ws+afmcEjE451K6KhkT3P/E6pP+NFY+T3z3+DXG86vfKzRR8K/1I4mhEuzC8Suc4LpyQ==
X-Received: by 2002:a05:6a00:1356:b029:13e:5203:fba3 with SMTP id k22-20020a056a001356b029013e5203fba3mr28672785pfu.3.1600384371921;
        Thu, 17 Sep 2020 16:12:51 -0700 (PDT)
Received: from sultan-box.localdomain ([104.200.129.212])
        by smtp.gmail.com with ESMTPSA id h15sm704319pfo.194.2020.09.17.16.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 16:12:51 -0700 (PDT)
Date:   Thu, 17 Sep 2020 16:12:48 -0700
From:   Sultan Alsawaf <sultan@kerneltoast.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        jikos@kernel.org, aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com,
        jarkko.nikula@linux.intel.com, kai.heng.feng@canonical.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, vicamo.yang@canonical.com
Subject: Re: [PATCH v2 3/4] i2c: designware: Allow SMBus block reads up to
 255 bytes in length
Message-ID: <20200917231248.GA345017@sultan-box.localdomain>
References: <20200917052256.5770-1-sultan@kerneltoast.com>
 <20200917052256.5770-4-sultan@kerneltoast.com>
 <20200917205704.GA18027@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917205704.GA18027@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 17, 2020 at 10:57:04PM +0200, Wolfram Sang wrote:
> On Wed, Sep 16, 2020 at 10:22:55PM -0700, Sultan Alsawaf wrote:
> > From: Sultan Alsawaf <sultan@kerneltoast.com>
> > 
> > According to the SMBus 3.0 protocol specification, block transfer limits
> > were increased from 32 bytes to 255 bytes. Remove the obsolete 32-byte
> > limitation.
> 
> Sadly, it is not that easy. We are trying to extend BLOCK_MAX to 255
> (SMBus 3 specs) but there are various things to be considered,
> especially with buffers and when passing it to userspace. Check here for
> the discussion (and you are welcome to join, of course):
> 
> http://patchwork.ozlabs.org/project/linux-i2c/list/?submitter=79741&state=*
> 
> > 
> > Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> > ---
> >  drivers/i2c/busses/i2c-designware-master.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> > index 22f28516bca7..5bd64bd17d94 100644
> > --- a/drivers/i2c/busses/i2c-designware-master.c
> > +++ b/drivers/i2c/busses/i2c-designware-master.c
> > @@ -433,7 +433,7 @@ i2c_dw_read(struct dw_i2c_dev *dev)
> >  			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
> >  			if (flags & I2C_M_RECV_LEN) {
> >  				/* Ensure length byte is a valid value */
> > -				if (tmp <= I2C_SMBUS_BLOCK_MAX && tmp > 0)
> > +				if (tmp > 0)
> >  					len = i2c_dw_recv_len(dev, tmp);
> >  				else
> >  					len = i2c_dw_recv_len(dev, len);
> > -- 
> > 2.28.0
> > 

Yes, it is not that easy to make the change on a global scale. However, in the
case of the designware adapter, it really *is* that easy. This change covers the
designware adapter, and others can follow later with the much more invasive
changes that are needed.

Sultan
