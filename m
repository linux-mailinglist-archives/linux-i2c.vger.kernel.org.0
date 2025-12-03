Return-Path: <linux-i2c+bounces-14380-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34332CA0A1B
	for <lists+linux-i2c@lfdr.de>; Wed, 03 Dec 2025 18:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CDC03309DB2
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Dec 2025 17:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF430334C10;
	Wed,  3 Dec 2025 17:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j65iO891"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ECF3321C9;
	Wed,  3 Dec 2025 17:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764781959; cv=none; b=VoQ+2RoIdlJMItE/lDR3zxjy+FYYfdWALQUb4zoSB5hbiUXfnpZuC0NrZ7OYWgTtMQQltc2mcgdtsg1Ux31UwrAfSEJMw+glJpzI9mej/pdP9WZDhiL61oSl48IWCWwoLul46qXrFdVKXfzeE2NP/501LlOTst2AzAIE7+aBOTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764781959; c=relaxed/simple;
	bh=U6O5GrCENsITqcgbPG2gx2Q7e/IEqWBVsxFY6Vrx+F4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwHe/+Q5Oc/KXzXTFSozqCOC7bEV+eQC2vNJQ5RycDfExpC8Su95OswifNWvPz49Ips1akgSOd5XSG6q0MwcavSI6JXdhOOqruIgaJ8DVZLRQNLqP80bd++fWUDbUumW5Ais7ErCSjYVxOXQz0WareJxQ3V0SKI1aMzgkW4+23w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j65iO891; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2141C4CEF5;
	Wed,  3 Dec 2025 17:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764781959;
	bh=U6O5GrCENsITqcgbPG2gx2Q7e/IEqWBVsxFY6Vrx+F4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j65iO891XsWDqIu2Cb2Zvw9Uvmuk2j7AXiJ/LLKH4QfrWHiZEmc9TGcW/C9o14VU+
	 6fDYerFBUO2fPI7Vnw8ie9degGlusHEa/K12ovTLDbDefA0oDImyMB68J/AN7ERWdh
	 2PBJ1tCch5HUYHHnQ1FZ5W8naesMcX0SQcWQVXUMx8jya7jRi05ePkpr5yaQ3FS9Qz
	 RhnVtw6t043J/hbkvn/2OIKYhwWwoaDmUH60+m/WU57Dpa8RJFt7Ne4ROo1tsnld8x
	 77vcZy4TJrudc5uJFWhcd8U20T/foAyspgRHQDXDwjcM05ugR5wwci3W5ihNmFJ2wF
	 kdR0sVe+v4kJA==
Date: Wed, 3 Dec 2025 18:12:35 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Eddie James <eajames@linux.ibm.com>, 
	Ninad Palsule <ninad@linux.ibm.com>, linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 11/12] i2c: fsi: Convert to fsi bus probe mechanism
Message-ID: <llnycqotkizcertwwgxzvt6pkesb3dca55mcbk24hconepbk7q@qknqcqsf4da4>
References: <cover.1764434226.git.ukleinek@kernel.org>
 <1311bce0d8617c7821cfe0769e97f13dc466d749.1764434226.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1311bce0d8617c7821cfe0769e97f13dc466d749.1764434226.git.ukleinek@kernel.org>

Hi Uwe,

On Sat, Nov 29, 2025 at 05:57:47PM +0100, Uwe Kleine-König wrote:
> The fsi bus got a dedicated probe function. Make use of that. This fixes
> a runtime warning about the driver needing to be converted to the bus
> probe method.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

looks all right:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi

