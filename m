Return-Path: <linux-i2c+bounces-12918-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C82B6B54B50
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 13:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 823973BFB9A
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 11:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D6F301012;
	Fri, 12 Sep 2025 11:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZTs+bXh6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3CAA920;
	Fri, 12 Sep 2025 11:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757677487; cv=none; b=QAp+F8Q/Wz+mi6PcLL0SqYvgXRri1MiAR8UxgGaswagqndGbrHXy36BhsKWfeIUeShj913XC0MAbOm1nkEY5mEQ2HZPi9YWRR5zEUKGtDHseUJiBmbW9ecXaoVHMEAvAfeqAd1NtMHeSIm0dZCIfzDfmjC/5hYCpVfNksVdAd6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757677487; c=relaxed/simple;
	bh=DMcy4lLGqxGXpI3eI5YfoU8fCZvbZRIkrODm2pgnZYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNGO3uryYPcLGEGtoqZQ1d2v/oW793VZ9a8w+X1rUgUJgkyztmK2RmqRGIG159UXcKz/yZAwUD3PlXnoIGMEnkQAHwKVxTyq1wkoDxeLY+/wG9l1exsnlkUwoIcs6C35ieUMMsj3SCU3daSYHjfqPzDgrFZm7SROlGAgh2XWBVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZTs+bXh6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C686C4CEF1;
	Fri, 12 Sep 2025 11:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757677487;
	bh=DMcy4lLGqxGXpI3eI5YfoU8fCZvbZRIkrODm2pgnZYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZTs+bXh6i96O0UC3UUh+pXJqabqWk4F8pucNNfqNHO3is9SsKiyYs6fE9bLMeF69l
	 3HjJMa2ZTrl9XYUdd12FlbqTAjDm4FLqYmRh4GH2VAR6yusS95ld3MacpcKBtxx5Hy
	 P5fGQo6hMIsREQOGbaACjWU9gUxVr1UKz9QI2EGA=
Date: Fri, 12 Sep 2025 13:44:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 3/3] i2c: Add Intel USBIO I2C driver
Message-ID: <2025091232-abruptly-stargazer-4a0e@gregkh>
References: <20250911181343.77398-1-hansg@kernel.org>
 <20250911181343.77398-4-hansg@kernel.org>
 <aMMVKsbDIIFzaWdu@ninjato>
 <18011d86-6f9e-4a0d-9514-fcc69cec1fc2@kernel.org>
 <aMPc_jHmlMsVtJKG@ninjato>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMPc_jHmlMsVtJKG@ninjato>

On Fri, Sep 12, 2025 at 10:42:38AM +0200, Wolfram Sang wrote:
> 
> > > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > 
> > Thank you.
> > 
> > Is it ok if Greg picks this up together with the rest of
> > the series?
> 
> Yes.

Great, I'll go queue it up in a bit, thanks!

greg k-h

