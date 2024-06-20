Return-Path: <linux-i2c+bounces-4155-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F839116EF
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 01:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCC8D1C208BE
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 23:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8437C14388C;
	Thu, 20 Jun 2024 23:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uazr1Ng+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA8685642;
	Thu, 20 Jun 2024 23:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718926762; cv=none; b=R6MAz5qUE1yshby7BSBaDm8iWwBLwhuih7iqkWx+jETK19prqfUqmzmZYF9li69ufU7n3rIAiS8/GSFAZjdt2hqlne3hINkp0EUWeZ73jI86mdrIhVSyzEU0MAzJnbfxR/qAYh6kKZGd1kgfe7Iq1U1ip/yzaDD+yDISS0WZmsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718926762; c=relaxed/simple;
	bh=ZTsiQqMQY/yygM8edKrLdH33RspBJECbft1I+55qbo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFGMfBxe2NAZEAOKpJRPQgD6cJG8slxMckooef1LifY9abjnWsKe4xzGeqpmysm9CwneSiQ80QNpoeaKTnhyix2nDrCbUBfTfzLtFoGVTCI60HZiDbU1M/jMokvfRFkqPhg8dTROGkLDNnpp63v46mnPz5uJVq538IORi9r3JBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uazr1Ng+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3587CC2BD10;
	Thu, 20 Jun 2024 23:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718926761;
	bh=ZTsiQqMQY/yygM8edKrLdH33RspBJECbft1I+55qbo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uazr1Ng+zJuygnc/AgdXatadITzCcNXszexXUDfn422Pr76/Xj4beqJWcHFfGtxTl
	 wua3wznNbM5o2/D2EQSU3bVEYw9ymvMifuLlIMUdNdKMpeiys1tWgRLnNTh4SZIRA2
	 wNAmvfVTO4bOEMxpuGhFcbZXZCD8E802rgN8z3t49FsWiZfLVCDU/mWi+i/e/E1vH8
	 UGijBbDs64cqUNntV/Sli424+Ua3Cxnk5GMnMgooDa3hntdxOeDPbhxB75/L2apeNR
	 iQ81yRpdjw5WRjWjlGxM0zFdO4W48l1cSTftCxCzWIJZUHAERYYQ8o2tqJXKwrlf5m
	 /tqAWa+nAAA6Q==
Date: Fri, 21 Jun 2024 01:39:18 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] docs: i2c: summary: document 'local' and 'remote'
 targets
Message-ID: <ynovieuafyisnqfuw4ryha6jkwogfuswrijvzqfrw22x22w2eb@hvpjsw3hrjht>
References: <20240614081239.7128-8-wsa+renesas@sang-engineering.com>
 <20240614081239.7128-13-wsa+renesas@sang-engineering.com>
 <4zxr4rlqnjqbqh3oxmd2ufqi6uk4pxa3tniuya5pgjtqi6tswc@utq4r2zt6z6b>
 <ed75fyc2xcsnwubq42eposf6ayt5aj2jmqz6mthugk6vm2zpi4@qqwlmuwayoo5>
 <y34k2k25xdr5z4v7oejp4da237s4o5qym5npihyydwlbsdh75c@vhmfl7sw3pbm>
 <7d5f800f-fc65-4fbf-adad-616d51501c62@linux.microsoft.com>
 <boehtgry7j7ulhrw7tenkmzxujahmxfn25imvb7zw2ibtmebbk@u3jryw4v2y7h>
 <cu2mkl42byhce6eytcnw7yseogbnypgtrkoirlezakwg35egdg@vjjye4ca7yey>
 <0f95bbc5-c1d6-4557-b401-90fcfe541df0@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f95bbc5-c1d6-4557-b401-90fcfe541df0@linux.microsoft.com>

On Thu, Jun 20, 2024 at 09:05:43AM GMT, Easwar Hariharan wrote:
> On 6/19/2024 12:10 AM, Wolfram Sang wrote:
> >>> "Synonyms" from patch 6 does say that controller/target is preferred but
> >>> couched it in the caveat "If speaking about I2C in general" and
> >>> adapter/client when "discuss[ing] implementation details." I was trying
> >>> to give space for an unambiguous recommendation.
> >>
> >> Exactly, this is what I referred to in my previous e-mails.
> >> These two statements sound a bit ambiguous to me, as well.
> > 
> > Okay, here is my proposed update:
> > 
> > ===
> > 
> > diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
> > index 90f46f1504fe..579a1c7df200 100644
> > --- a/Documentation/i2c/summary.rst
> > +++ b/Documentation/i2c/summary.rst
> > @@ -67,9 +67,9 @@ Synonyms
> >  
> >  As mentioned above, the Linux I2C implementation historically uses the terms
> >  "adapter" for controller and "client" for target. A number of data structures
> > -have these synonyms in their name. So, to discuss implementation details, it
> > -might be easier to use these terms. If speaking about I2C in general, the
> > -official terminology is preferred.
> > +have these synonyms in their name. So, when discussing implementation details,
> > +you should be aware of these terms as well. The official wording is preferred,
> > +though.
> > 
> > ===
> > 
> > I don't want to be stricter than "preferred". If someone still wants to
> > use 'struct i2c_client *client' this is fine with me.
> 
> I'm ok with this. I'll let Andi decide if he wants to have
> adapter/client refactoring now or in the future or at all.

yes, let's see how it goes.

Thanks, Easwar!

Andi

