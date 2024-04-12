Return-Path: <linux-i2c+bounces-2922-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB938A32C1
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 17:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1779A289E94
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 15:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0ABE1487F4;
	Fri, 12 Apr 2024 15:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UxbilgA5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E8E85278;
	Fri, 12 Apr 2024 15:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712936583; cv=none; b=PGBmBmGB0FnE5cf2L+GrwTcxWv+lBSFI53t141kqi6NTzNyH//XHxNfXHBHgfdonpwRkMa8tkn9PnnxR9/QcVLE7YNVbwZajtfKIkrsQei48in/6Idq5SOFe3uG71qjfOB/Wyqgpqj4/HDkZDq0Rvy5HhWn8zqQyETsywhx1YDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712936583; c=relaxed/simple;
	bh=3FuAGNTlMzl0LTaHUSudmgttv4WTSlpHC791d8lPyY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBx+So6qlMBxzjbmbIH5kvYJIeht4ZbXenxt0WpMuBHGdqpsvxmwkpKChFeew1ukKHMU6+EW1O8Jj/QUf4V7qPMv3LdEHXFvSEBQFKCRznlTQYeb8P0eiaPv8L34zCArSzdKT5Piq8oIzzsGwow4hQGsw9Wd51N7WUruf+p+xNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UxbilgA5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8675DC2BBFC;
	Fri, 12 Apr 2024 15:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712936583;
	bh=3FuAGNTlMzl0LTaHUSudmgttv4WTSlpHC791d8lPyY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UxbilgA5x95+vEmMGikb4EOm5bFpgeGcXoyUVlCYzZDhgdwJLEAs9fAt3/tDQsdIH
	 f52CBl3LK7VwUs29mw/davGhuF2msMZOIfeJ7MNwiL7/5K7yIWwJxBEff3AVRu971f
	 yyPEZcdnA06fKQpgQdZco0Qmbutl6XFmGMNrIjtaG0HsGQ9vhcZ0ap5tiwp8U6Y0Mi
	 hxth2hv8k8/4/yI9y8xSQ4THKLc1ipl7L2AlZemKaPS62TVBz78Ys+2DK5Yht81uzH
	 ml2Sz1wEVw67lfL6F2i5nn/JkrhaQnGgFyuKFvFUMFl1CCiFtI+6SW0B4bYlPS0qjC
	 DCl7kREwssSug==
Date: Fri, 12 Apr 2024 17:42:59 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Animesh Agarwal <animeshagarwal28@gmail.com>, 
	linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in ARM/LPC32XX SOC SUPPORT
Message-ID: <j7qsoawx2d7elep35szjurw4owaccgs4itvtcfyxicyz5liruc@jn5bc3gx2453>
References: <20240411050257.42943-1-lukas.bulwahn@redhat.com>
 <bfjccttmurk7aajps2m7gcyl532rg7rnlutfhbvupsphxjk2pa@fx5onnkr7625>
 <CAOc5a3P-LX0dkhLFxF-ggOxqkLqM0DJcXqccMJJqtF9U5rbEsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOc5a3P-LX0dkhLFxF-ggOxqkLqM0DJcXqccMJJqtF9U5rbEsQ@mail.gmail.com>

> On Fri, Apr 12, 2024 at 11:34 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> > On Thu, Apr 11, 2024 at 07:02:57AM +0200, Lukas Bulwahn wrote:
> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> >
> > before taking this I just want to make sure the e-mail in the SoB
> > is correct as checkpatch is warning me about 'lbulwahn' and
> > 'lukas.bulwahn'.
> >
> > It's not about the warning, just double checking the e-mail
> > address as often to mix my addresses up and looks also your first
> > patch with the redhat e-mail.
> >
> 
> Thanks for the hint. And yes, that is a stupid setup mistake from my
> side or at least from the email server's side.
> 
> I joined Red Hat at the beginning of April and hence, it was my first
> email with the redhat address.
> 
> lbulwahn is my 'official email address', lukas.bulwahn is an email
> alias to the same mailbox. I actually want to have the commits in the
> kernel carry 'lukas.bulwahn@redhat.com' and not 'lbulwahn'.
> 
> I have sent them out with 'From: Lukas Bulwahn
> <lukas.bulwahn@redhat.com>' in my patch file; so, checkpatch did not
> complain locally.
> 
> The gmail server however turns this into:
> 
> From: Lukas Bulwahn <lbulwahn@redhat.com>
> X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> I will see what I can do and send out a v2.

no need... I will keep things as they are; as long as I know
these are the same mails I'm fine.

Thanks,
Andi

