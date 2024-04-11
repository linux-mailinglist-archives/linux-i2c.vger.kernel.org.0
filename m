Return-Path: <linux-i2c+bounces-2886-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 730908A0C0E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 11:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A465B1C21958
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 09:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C702614388B;
	Thu, 11 Apr 2024 09:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JxQgfbfo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82993144308;
	Thu, 11 Apr 2024 09:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712826982; cv=none; b=CWpCEXAHNPfMMOS3ReC3BL9ki+Mpnl4ncIv8jxbdwyX0k933aM8S0gjIXhEslrluglotkaWBVuFzhB/Qtsof+b4ygDHA9E6jZGDBEmq9M/vBWs+xfB7rzaZJ5NiqMG8AP4t0OXcEwZBCy8SchqnL2SWdBGJKdQPfmd8RrBeoKsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712826982; c=relaxed/simple;
	bh=FD7ZMwASDJLrGL9Q6rjiGOks+Hr3Q/CkNdWe0CnAC5Y=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAuWMQiIFfcmmlsZf+0GKkrbBN/rAAhGz2qfGOhl+UvNTH/9z83uPffpeD53Nm11g8i//hnyDUjGJhaoyuBEpXWet3D5mWct1ELijnljThbJcJtzFr0UHQQrgNmCzMJXVcy55jtr1FR8cq5uvEiet0YOZNRzs5xdyJDtQrri9b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JxQgfbfo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 725DCC43390;
	Thu, 11 Apr 2024 09:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712826982;
	bh=FD7ZMwASDJLrGL9Q6rjiGOks+Hr3Q/CkNdWe0CnAC5Y=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=JxQgfbfoQPXO75Bvknepu7S5cybTc3MuoQxVXQLt2ysmPPAaTjqT02Nd97CxO0pOO
	 +1URVbwdMMYoIA/kMSt4tEl73wG3Uv9yTcFg4l8DweKTfYYmOz70yk2tdTZzySXy+G
	 aElkNiC7Rr7vn8UQyfLKL7SIHuJ/J7V997QuSv5ZYnHJi8tG61SdtdM4Ysu0DKVCXE
	 3t4z4kuo2V17Ox/+p9TyCgojMPsl5mg4IvclbQUADWH+9gEz4DTlj7nJ5B9s97gEIA
	 gT9T0/RCTwIT1dQ1IfKsvQW26nQo21nE06KUa+3vp2Om56N22GlnrTP6gfdDtEm3h4
	 3TwLQQPGas0lg==
Date: Thu, 11 Apr 2024 11:16:18 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/18] i2c: i801: remove printout on handled timeouts
Message-ID: <uvnhbxkhj4skur5uhmbdtmbc4ebodrdujfzqmrv6tjejwvjrxk@xvad5h5ciiay>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <20240410112418.6400-26-wsa+renesas@sang-engineering.com>
 <242ogjpole3ltk5nu53knbfsxmmwcqfrbcivjh7fnkngvrroq5@cwspwdrtepwh>
 <zmkluzi3ncze67wei6eccd67cpuab2k7qw7cdgju4tg7rermv2@hw6ukejz4cvy>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zmkluzi3ncze67wei6eccd67cpuab2k7qw7cdgju4tg7rermv2@hw6ukejz4cvy>

Hi Wolfram,

On Thu, Apr 11, 2024 at 09:02:52AM +0200, Wolfram Sang wrote:
> On Wed, Apr 10, 2024 at 02:21:58PM +0200, Andi Shyti wrote:
> > On Wed, Apr 10, 2024 at 01:24:20PM +0200, Wolfram Sang wrote:
> > > I2C and SMBus timeouts are not something the user needs to be informed
> > > about on controller level. The client driver may know if that really is
> > > a problem and give more detailed information to the user. The controller
> > > should just pass this information upwards. Turn all timeout related
> > > printouts to debug level.
> > > 
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > ---
> > > 
> > > Here, I did not delete the printout to support checking the termination
> > > process. The other drivers in this series do not have this SMBus
> > > specific termination step.
> > > 
> > >  drivers/i2c/busses/i2c-i801.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> > > index 4294c0c63cef..a42b5152f9bd 100644
> > > --- a/drivers/i2c/busses/i2c-i801.c
> > > +++ b/drivers/i2c/busses/i2c-i801.c
> > > @@ -400,7 +400,7 @@ static int i801_check_post(struct i801_priv *priv, int status)
> > >  	 * If the SMBus is still busy, we give up
> > >  	 */
> > >  	if (unlikely(status < 0)) {
> > > -		dev_err(&priv->pci_dev->dev, "Transaction timeout\n");
> > > +		dev_dbg(&priv->pci_dev->dev, "Transaction timeout\n");
> > 
> > why after 5 patches of removing dev_err's, here you are changing
> > them to dev_dbg?
> 
> The reasoning was explained above:
> 
> > > Here, I did not delete the printout to support checking the termination
> > > process. The other drivers in this series do not have this SMBus
> > > specific termination step.
> 
> This is also why I converted two calls here to dev_dbg. But read on
> first.

It would make sense if the debug would give some more
information...

> > It's still good, but if we want to be strict, errors should
> > print errors: as we are returning -ETIMEDOUT, then we are
> > treating the case as an error and we should print error.
> 
> I strongly disagree. While we use an errno, we don't know if this is a
> real error yet. It is more a return value saying that the transfer timed
> out. The client driver knows. For some I2C clients this may be an error,
> but for an EEPROM this might be an "oh, it might still be erasing a
> page, let's try again after some defined delay".
> 
> Think of 'i2cdetect': If we printout something in the -ENXIO case (no
> device responded to the address), the log file would have more than 100
> entries on a typical I2C bus. Although we know that -ENXIO will be the
> majority of cases and are fine with it.
> 
> > As you did before, I would just remove the printout here.
> 
> Maybe we could because there is still the "Terminating the current
> operation" string as debug message making the code flow still clear.

... e.g. for me it's not totally right if we do:

	dev_dbg("timed out")
	return -ETIMEDOUT;

Considering that this might not be a real error I would let the
calling function decide and print. Indeed i801_access() is not
even checking the error but letting the caller of smbus_xfer()
decide.

It would make more sense if we provide more information like:

	dev_dbg("Terminating current operation because the bus is busy and we timed out");

Just merged the two consecutive messages (we could still trim it
a bit and reduce dmesg spam).

The second /dev_err/dev_dbg/ in this file to me is fine (even
though it's not really self explaining).

> > I will wait a bit for more comments and take patches 1 to 5 so
> > that I can unburden you a little from them.
> 
> The patches have no dependencies. To keep mail traffic low, I suggest
> you continue reviewing and I only resend the i801 patch?

Yeah... I'll wait a few more days and give more time for reviews
and comments. I checked the rest of the series and it's fine.

If you are willing to send a V2 you could send it as reply to
this mail instead of resending everything.

Thanks,
Andi

