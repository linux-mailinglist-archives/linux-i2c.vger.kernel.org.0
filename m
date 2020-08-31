Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28CF5257B96
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 17:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbgHaPBo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 11:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgHaPBm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Aug 2020 11:01:42 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38912C061573
        for <linux-i2c@vger.kernel.org>; Mon, 31 Aug 2020 08:01:42 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id l9so1517132plt.8
        for <linux-i2c@vger.kernel.org>; Mon, 31 Aug 2020 08:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=h7lNOgEVyx8v8t9yCT4l2hOs5HP15stuEYfKGUuqjcw=;
        b=vCSU+xwUziyBzy6HJMzdg00tJREFrP2dkQdl5taF7mkM777FmeuBl8dHZGclQSQHxn
         rsjgmTOI4KylSj/vPvvpq7STma9cICZTPfBln4Fy8SRwMQNQHxPvYQ5wT2wVM67HnzgV
         73dP5IXso1heziZQr69iCB8Ab41moQtiioQGyXBk0Y/Pk7HKeXf57EzjyVYiBQZAAQ7w
         ZhNB+5deI2IW+gJPr1/RWkau0lEOpn2c1DFAqqx685phrNfk4MkoewpzdHw/69B4P1cZ
         QRZSO/D1UmpTpDTdclXkOlt9cb/a1ANx1eheAaX80rMa4l+sUY8FqTQA1cUbOPeYeeGn
         fofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=h7lNOgEVyx8v8t9yCT4l2hOs5HP15stuEYfKGUuqjcw=;
        b=gwK1+6YAf5DTVbcwZBcTtu3YYlNbRM32vBFxu7w8Yh/B5KF6ylGBOlRq4nRwkHY24d
         2aFGcVznjvznprcG+9PbrHGa/N+rCbpys8XhcEB4UqtbS9fL2Bi1BsfoNMdAh494qlDo
         0E7bpVLYoF0WZ9kMc2cGU/QfAdRJCPbtAfryhXeyNVxPL7+a0P188rirAQuyDfWYnuhG
         BFT9u2A0Vp+aeMgL37yJKgKMQkWhpPgGIB6HAVJvXPeMZAzW8b7jte0FAl+gkH21zt3t
         BY4adMxfnsXFc2SCnN0uC/CGgLOabNTSM24qBZ94Ik4j9jOYpeiIv5mikdu9+4aW0Bsr
         E+pg==
X-Gm-Message-State: AOAM532gHdjNLgvjVv7ppfiA929cdArVRxEjdipq6i5CIcpZBIgCt1Wi
        5cNnYd1nfQQtjinJRIVxhGU=
X-Google-Smtp-Source: ABdhPJyEuTj/YsQ9iFYL40AtFocRJO+8YqBnZhDo22dPGjCLvLh+UJ9acxVdvVfaWhIDVH0VQKiWkA==
X-Received: by 2002:a17:902:780f:: with SMTP id p15mr1393163pll.56.1598886101587;
        Mon, 31 Aug 2020 08:01:41 -0700 (PDT)
Received: from gmail.com ([223.190.108.199])
        by smtp.gmail.com with ESMTPSA id 67sm606092pfv.173.2020.08.31.08.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 08:01:40 -0700 (PDT)
Date:   Mon, 31 Aug 2020 20:29:29 +0530
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [PATCH] i2c: i801: Fix resume bug
Message-ID: <20200831145929.GA11480@gmail.com>
References: <20200825191303.4a258073@endymion>
 <20200828085753.GH1343@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200828085753.GH1343@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 28, 2020 at 10:57:53AM +0200, Wolfram Sang wrote:
> On Tue, Aug 25, 2020 at 07:13:03PM +0200, Jean Delvare wrote:
> > From: Volker Rümelin <vr_qemu@t-online.de>
> > 
> > On suspend the original host configuration gets restored. The
> > resume routine has to undo this, otherwise the SMBus master
> > may be left in disabled state or in i2c mode.
> > 
> > [JD: Rebased on v5.8, simplified a condition.]
> > 
> > Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > ---
> > I noticed this bug in a QEMU x86_64 q35 VM booted with OVMF. OVMF
> > doesn't initialize the SMBus master. After 1s of SMBus inactivity
> > autosuspend disables the SMBus master. To reproduce please note QEMU's
> > ICH9 SMBus emulation does not handle interrupts and it's necessary
> > to pass the parameter disable_features=0x10 to the i2c_i801 driver.
> > 
> > Note from JD: I can't test this.
> 
> Thanks for keeping up with this one. I have one high level comment but I
> hope Volker, Bjorn, and Vaibhav have comments/tags, too.
> 
> > +static unsigned char i801_setup_hstcfg(unsigned char hstcfg)
> > +{
> > +	hstcfg &= ~SMBHSTCFG_I2C_EN;	/* SMBus timing */
> > +	hstcfg |= SMBHSTCFG_HST_EN;
> > +	return hstcfg;
> > +}
> 
> What about putting the write to SMBHSTCFG here, too. When I read the
> function name, I assumed it will do that.
> 
> > @@ -1961,8 +1965,11 @@ static int i801_suspend(struct device *d
> >  
> >  static int i801_resume(struct device *dev)
> >  {
> > -	struct i801_priv *priv = dev_get_drvdata(dev);
> > +	struct pci_dev *pci_dev = to_pci_dev(dev);
> > +	struct i801_priv *priv = pci_get_drvdata(pci_dev);
> > +	unsigned char hstcfg = i801_setup_hstcfg(priv->original_hstcfg);
> >  
> > +	pci_write_config_byte(pci_dev, SMBHSTCFG, hstcfg);
> 
> And on top of that, we could skip the 'hstcfg' variable here.
> 
Add extra parameter of "struct pci_dev*" type in i801_setup_hstcfg(). We can
also skip the introduction of "struct pci_dev*" type variable in .resume()
then. Just use to_pci_dev(dev) .

Thanks
Vaibhav Gupta

