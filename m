Return-Path: <linux-i2c+bounces-2909-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A368A26EB
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 08:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52A0A1C20A23
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 06:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8D146449;
	Fri, 12 Apr 2024 06:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=scram.de header.i=@scram.de header.b="QU0RfYY8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esg.nwe.de (esg.nwe.de [195.226.126.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2934344369
	for <linux-i2c@vger.kernel.org>; Fri, 12 Apr 2024 06:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.226.126.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712904446; cv=none; b=or7z95cAFkNvi9CvVHTJClVa6SlFxO408/QAIR0huCPoRIFau30S0BBvSTVrzDcqFhCTkoRRKnFiRwNOb2fkx2gigKVSNkZylSTu1AsDQXSD2BxKkdSA/VZlV5a4yB23iWN0fw+faDQQ2KuX4cEOKd7A4kdRWWZwH9oZrWem/gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712904446; c=relaxed/simple;
	bh=rUn7NaZAS5hnRq6kHRzju/FnH7ibYcmkgTvUbuxKoxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uI2isXwFf8LXNuy89VGiZ67iJPZXMHaC3fMqOL2vafA0FGfTINqucTEEpcdR1J5pCirSaUzRnTQVoOCSMwVy7BhG36M+IbY6NUgDvjRnxluqp1+vLeTxgyjjryHazTAqQ1AFxpBNP17PgPW7xmZ7lx09F1BPt5qPsrSdrFdCo5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=scram.de; spf=pass smtp.mailfrom=scram.de; dkim=pass (1024-bit key) header.d=scram.de header.i=@scram.de header.b=QU0RfYY8; arc=none smtp.client-ip=195.226.126.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=scram.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scram.de
X-ASG-Debug-ID: 1712903570-1ed71d5dc82363b80001-PT6Irj
Received: from mail.scram.de ([213.206.175.31]) by esg.nwe.de with ESMTP id 2CinZMVeoB7m5L6B (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Fri, 12 Apr 2024 08:32:50 +0200 (CEST)
X-Barracuda-Envelope-From: jochen@scram.de
X-Barracuda-Effective-Source-IP: UNKNOWN[213.206.175.31]
X-Barracuda-Apparent-Source-IP: 213.206.175.31
Received: (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender)
	by mail.scram.de (Postfix) with ESMTPSA id F29EF8A7031;
	Fri, 12 Apr 2024 08:32:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.scram.de F29EF8A7031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scram.de;
	s=mail2021; t=1712903570;
	bh=Gh1QR2+zPfWSt6AeuaYH86pSHzi1XIf0LhYJrlsTzsg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=QU0RfYY8DbePZ5cSqGjXgEv7Vqq8xXXIJdVQk1JyOqck38FEgC4x4H3/iUqgARSmp
	 w/FjXl7ccBDgbfreaX/myLtF/cvSFBvQddT0I9Vr126eXMNC1gHQ5Fe2HBPVZf382k
	 oaWYoJzQMfqct/IRNrqiFhe7B7263vktH3B2taw8=
Message-ID: <2271dcf2-83c3-4570-87f5-c483faa2f9cd@scram.de>
Date: Fri, 12 Apr 2024 08:32:48 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/64] i2c: cpm: reword according to newest specification
To: Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
X-ASG-Orig-Subj: Re: [PATCH 14/64] i2c: cpm: reword according to newest specification
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-15-wsa+renesas@sang-engineering.com>
 <jpp67ejeropvsc6gwompwc5t2nbl6cde2o33vtf42e2on2ycal@42ovfdhp6oh4>
 <maxjcriuq6qfoeoing5ic7l5pnxdyylovjdoh4w3bzhnmco6ax@mslv35p4k35k>
 <26y3smrxv3q56peuqatospr3q6annxvdmleyhykyrjrovne6mu@yg44mmr7aaqp>
From: Jochen Friedrich <jochen@scram.de>
In-Reply-To: <26y3smrxv3q56peuqatospr3q6annxvdmleyhykyrjrovne6mu@yg44mmr7aaqp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Barracuda-Connect: UNKNOWN[213.206.175.31]
X-Barracuda-Start-Time: 1712903570
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://195.226.126.84:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at nwe.de
X-Barracuda-Scan-Msg-Size: 423
X-Barracuda-BRTS-Status: 0
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=5.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.123398
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

>>>>   	out_8(&cpm->i2c_reg->i2mod, 0x00);
>>>> -	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Master mode */
>>>> +	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Host mode */
>>> I2COM_MASTER might be coming from the datasheet.
>> Maybe we can just drop the comment? The value we write is pretty
>> self-explaining.
> indeed.
>
> Andi

I also agree. You might add my Acked-By: <jochen@scram.de> here. Jochen


