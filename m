Return-Path: <linux-i2c+bounces-1104-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0D4823E73
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 10:19:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A0E01C237CE
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 09:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1502F2032B;
	Thu,  4 Jan 2024 09:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1A1/kdR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EAA2030A
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jan 2024 09:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F3AC433C8;
	Thu,  4 Jan 2024 09:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704359937;
	bh=ZwRpv+i4A3tExZFbCt8lxtVcCymSTA3BV1xecuZu0k0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1A1/kdR4fp0PUpKfh6vmwtskybml2Ts910TTm5rgyGuh7TH+Z/EaDB7oez8YgIvm
	 sfHE9easgyJUpvbv0dR4EUXNL5/VuDbUJ2BpllNmP/te2IYRkOnaHw1TvEs4W5OLU+
	 0rXaBkfGAR+gDNg/8S+7HebNp6HKirwDcRdky4Q640BgPEJeiva9VvQHbRJQvbhg5b
	 S9QIvdK+1OcoYcuqxcsUhRYJ42I8evbGMI7SrX8Tg3oeEiBUqe0kna9vsZ7jh8a5OO
	 WZPq5nrRK1P69/G7pV3MbKASbW26JbAJbzuqWH0UtlbK3Y54ZhMDm4kzdSioUGNw0b
	 Tv+UxopgxaM3A==
Date: Thu, 4 Jan 2024 10:18:53 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <HansHu-oc@zhaoxin.com>
Cc: wsa@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v6 6/8] i2c: wmt: fix a bug when thread blocked
Message-ID: <hlsrxgsmrnhieswh3rdytrs4a5qzkrw4h7pcsupmwkrtoijhyo@begus62i5p77>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
 <b0f284621b6763c32133d39be83f05f1184b3635.1703830854.git.hanshu-oc@zhaoxin.com>
 <20240103193911.qbc5m5yz7cbi5l7u@zenone.zhora.eu>
 <249630b9-e1d7-4f3a-b053-02edcc50bf42@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <249630b9-e1d7-4f3a-b053-02edcc50bf42@zhaoxin.com>

Hi Hans,

...

> > > @@ -58,6 +58,8 @@ struct viai2c {
> > >   	u16			tcr;
> > >   	int			irq;
> > >   	u16			cmd_status;
> > > +	ktime_t			ti;
> > > +	ktime_t			to;
> > don't these need some arbitration?
> > 
> 
> I don't think it needs to be arbitration.
> the controllers are independent of each other,
> each access is locked using __i2c_lock_bus_helper().
> Am I missing something?

no, it's fine, it's me who missed that. Do you mind writing a
comment?

Thanks,
Andi

