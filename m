Return-Path: <linux-i2c+bounces-6681-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A98977BA1
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1818B22564
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 08:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1072A1D58AB;
	Fri, 13 Sep 2024 08:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvfnj9Pn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B311AD256;
	Fri, 13 Sep 2024 08:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726217563; cv=none; b=FOmiOMyiE9e2gZTe4vooadsIqcuicrDdTcVlyMRvc4MPpG6M/NEP+y6dCgSJJ/AOB1mC3IvmpppwvVCK7n32vKIvw/CzmRQ7mnScNJUcaXQNj7ySLWI1dz9d0nMMDSNhLZnAIxlp+U4rBzhFUzVh2MgWWUq+3k6+hEoQVzq91Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726217563; c=relaxed/simple;
	bh=u5PZfoHHduyDVk2oOdcetiVZcs9IihPNrUYn6Fio744=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1ntftRoEj1EUUjzOrpnMusbsBn+bMbPzoL4zn7T0AQ8mG34QEv32F1bbQz+jwU2jggVBY7Goqv3RxAxl+YN9dLN8FEwb2jzOKvanhfK+894EAMZwbiYBYq5LFOksS1NctiFteOrmpQBP2wIIuX1lsE/nVoMp4uGoEgRFw/ZENU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bvfnj9Pn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A709C4CEC0;
	Fri, 13 Sep 2024 08:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726217563;
	bh=u5PZfoHHduyDVk2oOdcetiVZcs9IihPNrUYn6Fio744=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bvfnj9PnU4jjDRGFduZHFwL2QrGZ+IqQqPN+q1NMqmVBRzxl0nYwzRPwc1dfxxdjX
	 c5kVIgaeuelejpPOm+ueeVECEuGtEIzJ9nnJmCq87KuWpxQ9BiAoUiuoe9cv3d/7/u
	 15QOJr9zPhnqlytuujeWh8aqbqm9J296oH2JTmfR+Lm9yzy4GadRQsB7/2Wmv5JT7p
	 lJr7X6RzSLnIQsfLQcmCg+8MhlEcR4Eo/s3XvKPrUXJlI0RcyQctIBaien6o73cjcj
	 fcGK3ezRRqW76ol1U7eeq+diuElfjt5QGfWtA2RTvsQuMglE25RasWUArPVp3uhEOG
	 yJLiwY7H40edw==
Date: Fri, 13 Sep 2024 10:52:38 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Liu =?utf-8?B?S2ltcml2ZXIv5YiY6YeR5rKz?= <kimriver.liu@siengine.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	"jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>, "jsd@semihalf.com" <jsd@semihalf.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v11] i2c: designware: fix controller is holding SCL low
 while ENABLE bit is disabled
Message-ID: <lon3lijqcb5zpylqfni4xecjxbv6tlfn4kmyn3zwfkhajyiamw@g72c4r7fo2c6>
References: <4ebc4e8882a52620cbca30f1bf25650cbc3723fb.1726197817.git.kimriver.liu@siengine.com>
 <CAHp75Vdbr5sJejwfkxYrgkdNMMZV+D5w1mipTxz=R+EkEUrA0w@mail.gmail.com>
 <971008d0fd32403198785e1e4543d108@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <971008d0fd32403198785e1e4543d108@siengine.com>

Hi Kimriver,

please, don't send v12 anymore, I will take care of these little
notes from Andy.

You did a great job at following up on all the reviews, thanks!

Andi

On Fri, Sep 13, 2024 at 08:31:18AM GMT, Liu Kimriver/刘金河 wrote:
> Hi Andy
>  
>   Subject:  [PATCH v11] i2c: designware: fix controller is holding SCL low while ENABLE bit is disabled
>   I will change the subject to：
>   Subject:  [PATCH v11] i2c: designware: fix controller is holding SCL low while the ENABLE bit is disabled
> 
> >-----Original Message-----
> >From: Andy Shevchenko <andy.shevchenko@gmail.com> 
> >Sent: 2024年9月13日 15:41
> >To: Liu Kimriver/刘金河 <kimriver.liu@siengine.com>
> >Cc: jarkko.nikula@linux.intel.com; andriy.shevchenko@linux.intel.com; mika.westerberg@linux.intel.com; jsd@semihalf.com; andi.shyti@kernel.org; linux-i2c@vger.kernel.org; linux-kernel@vger.kernel.org; Andy >Shevchenko <andy@kernel.org>
> >Subject: Re: [PATCH v11] i2c: designware: fix controller is holding SCL low while ENABLE bit is disabled
> 
> >On Fri, Sep 13, 2024 at 6:35 AM Kimriver Liu <kimriver.liu@siengine.com> wrote:
> >>
> >> It was observed that issuing the ABORT bit (IC_ENABLE[1]) will not 
> >> work when IC_ENABLE is already disabled.
> >>
> >> Check if the ENABLE bit (IC_ENABLE[0]) is disabled when the controller 
> >> is holding SCL low. If the ENABLE bit is disabled, the software needs 
> >> to enable it before trying to issue the ABORT bit. otherwise, the 
> >> controller ignores any write to ABORT bit.
> >>
> >> These kernel logs show up whenever an I2C transaction is attempted 
> >> after this failure.
> >> i2c_designware e95e0000.i2c: timeout waiting for bus ready 
> >> i2c_designware e95e0000.i2c: timeout in disabling adapter
> >>
> >> The patch fixes the issue where the controller cannot be disabled 
> >> while SCL is held low if the ENABLE bit is already disabled.
> >
> >...
> >
> >> +                       /*Set ENABLE bit before setting ABORT*/
> 
>        /* Set ENABLE bit before setting ABORT */
> 
> >Missing spaces
> >
> >...
> 
> >> +/*
> >> + * This function waits controller idling before disabling I2C
> 
> >waits for controller
> 
>  + * This function waits for controller idling before disabling I2C
> 
> >> + * When the controller is not in the IDLE state,
> >> + * MST_ACTIVITY bit (IC_STATUS[5]) is set.
> >> + * Values:
> >> + * 0x1 (ACTIVE): Controller not idle
> >> + * 0x0 (IDLE): Controller is idle
> >> + * The function is called after returning the end of the current 
> >> + transfer
> >> + * Returns:
> 
> >> + * False when controller is in IDLE state.
> >> + * True when controller is in ACTIVE state.
> 
> >Yeah, I know that this is a copy of what I suggested, but if we going to amend, these should be with definite article
> 
> > * False when the controller is in the IDLE state.
> > * True when the controller is in the ACTIVE state.
> 
>  
> 
> >> + */
> 
> >...
> 
> >> +       return regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
> >> +                                      !(status & DW_IC_STATUS_MASTER_ACTIVITY),
> >> +                                      1100, 20000) != 0;
> 
> >You broke the indentation again.
> 
> it has been indented and aligned from the web：
> https://lore.kernel.org/all/4ebc4e8882a52620cbca30f1bf25650cbc3723fb.1726197817.git.kimriver.liu@siengine.com/
> 
> Thanks！ 
> 
> >--
> ------------------------------------------
> Best Regards
> Kimriver Liu

