Return-Path: <linux-i2c+bounces-12549-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 379C0B3ED81
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 19:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0736017D38E
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 17:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9FE3064A7;
	Mon,  1 Sep 2025 17:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q1imVZbH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D80627145F;
	Mon,  1 Sep 2025 17:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756748899; cv=none; b=M3JJkCoO9gSccqjfR+//cyka+p9Hh58ABE+Czvh7odYoa9qReCTtE6yFVVawZ0TKOJwxXYEE8i+tdee8lUyzvCrLMC6dXNvFd7h44KtHMwi4GGsu+LJqtVu3zBK2iXqCGDtlHIHwRfqsJtr0zTAd4KwHLlaqtcATfgRaDuRUVn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756748899; c=relaxed/simple;
	bh=SFO9B6Z1ifmG17PyufZegYEBKGIDqVkjQU7YPnZLOjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qZmH0Co03mLstIXXRQFKW0Is/+jX722b9ExV8gu1zpT9Ody5/KEzXq2pdlBRphgEo//34QrHmhSf6QVALh+cXHctYPmhl934IMiTloxhUDYhDPOR20hjOmolk2fWRNbU5W6vYPSxAVlrrNuJSrnYi6ho+SZthq2cSsu1wVlCjHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q1imVZbH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FD0C4CEF0;
	Mon,  1 Sep 2025 17:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756748899;
	bh=SFO9B6Z1ifmG17PyufZegYEBKGIDqVkjQU7YPnZLOjE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q1imVZbHXa0/MjYp6cFnMXV4sJXE1rv/V01TizRB58U7P5j5DF5WzyGprTuDMBlz3
	 BsBuvEg6xzHnEhU3+SApe3detCOaoti8W/MypysNjlOC6lwtSBg1/+NPkHssHCxPF6
	 lxt1QRd0IrAmNsELBJzMzcmq2kSXNaNhSaBy7CWbDEWrF/9/pn/Pd8SLTsHXFAnkEQ
	 7rV1HfnxG34M2Uws4OfW3lWAR0GIj9e/IkRwmJr9bCvVIHYPZtL5WY/uVIDyh5Rt+S
	 CBYPxU5e8rooLX8W2zBoeZX9xZxpS+VIzuCcoTqF9PgaTtmLzPmFcm9Cppj+9izZA5
	 XgUWnU5tlbVCA==
Message-ID: <9ed3743b-4f86-42d3-94e0-8a720526dce4@kernel.org>
Date: Mon, 1 Sep 2025 19:48:14 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] device property: Add scoped fwnode child node
 iterators
To: =?UTF-8?Q?Jean-Fran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org
References: <20250901163648.82034-1-jefflessard3@gmail.com>
 <20250901163648.82034-2-jefflessard3@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250901163648.82034-2-jefflessard3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/1/25 6:36 PM, Jean-François Lessard wrote:
> Add scoped versions of fwnode child node iterators that automatically
> handle reference counting cleanup using the __free() attribute:
> 
> - fwnode_for_each_child_node_scoped()
> - fwnode_for_each_named_child_node_scoped()
> - fwnode_for_each_available_child_node_scoped()
> 
> These macros follow the same pattern as existing scoped iterators in the
> kernel, ensuring fwnode references are automatically released when the
> iterator variable goes out of scope. This prevents resource leaks and
> eliminates the need for manual cleanup in error paths.
> 
> The implementation mirrors the non-scoped variants but uses
> __free(fwnode_handle) for automatic resource management, providing a
> safer and more convenient interface for drivers iterating over firmware
> node children.
> 
> Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>

Thanks for adding a user and splitting it up (Andy was a bit faster than me :).

> diff --git a/include/linux/property.h b/include/linux/property.h
> index 82f0cb3ab..279c244db 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -176,6 +176,20 @@ struct fwnode_handle *fwnode_get_next_available_child_node(
>   	for (child = fwnode_get_next_available_child_node(fwnode, NULL); child;\
>   	     child = fwnode_get_next_available_child_node(fwnode, child))
>   
> +#define fwnode_for_each_child_node_scoped(fwnode, child)		\
> +	for (struct fwnode_handle *child __free(fwnode_handle) =	\
> +		fwnode_get_next_child_node(fwnode, NULL);		\
> +	     child; child = fwnode_get_next_child_node(fwnode, child))
> +
> +#define fwnode_for_each_named_child_node_scoped(fwnode, child, name)	\
> +	fwnode_for_each_child_node_scoped(fwnode, child)		\
> +		for_each_if(fwnode_name_eq(child, name))

IIRC, your first patch mentioned that your driver series would only use
fwnode_for_each_available_child_node_scoped().

And this series adds a user for fwnode_for_each_child_node_scoped(); do you also 
have a user for fwnode_for_each_named_child_node_scoped()?

