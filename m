Return-Path: <linux-i2c+bounces-10227-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0537DA81552
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 21:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FC337B75C0
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 19:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681E723E33E;
	Tue,  8 Apr 2025 19:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="I2Xj45fJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C609D1CD1E0;
	Tue,  8 Apr 2025 19:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744139073; cv=none; b=CEWSxwKE+I/6k9EZS7fIqUojPgUg6Tar2uwHEh9geqzetla+WpWhI4O2RmyTAK34iEHPHPDip0Hs0j3urPukF+1LOJCDoekdpz0b61Qs76wB7VJkkxFP9YR3G5ECQ65NbExFifnJxTir8Ibjib4WHy3hBEkDb61kUohWJP9B/5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744139073; c=relaxed/simple;
	bh=NtBCWUxxDuGgaBoBgXUpcx7d3iSvGcqPi1jOe2FQvvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCsyKqEG9kuxrtIlFwLh2QGvGwRwE8j0zbArb21OcHfxTsrjeTuVW+n621Jza7i3ClGYBjDmbbY/9ONWnEz+c8PLEAv3gy+S9niGLfPeHMbIWjip1EBjwk6EZAEd/SAaTqiD54CdCAO9mxrK5+96dzUBhr1OpNO/n7WjYJ9Y3DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=I2Xj45fJ; arc=none smtp.client-ip=80.12.242.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 2EF6uD7N4B4qz2EF9ubaWI; Tue, 08 Apr 2025 21:04:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1744139060;
	bh=iire6AmdsCZKw3Q/MjZ/41gt4RQr5jCzoxH0LpfBJdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=I2Xj45fJ7ekZQSNUqSpg7lS5jiXIS50RvucZtkfPevdjTw0K2TaU0rIENA+nv9RpR
	 eRDaKpBo32R6gHgeO2d5Fs4W4DvYpxrajaJp+c1O2sirkJ9nTF3F8dbhFtjSFuR9DJ
	 +NyiNyiXQmuVsxt14fQSxcCNfZEoOtWDNNCI059jh90cAQyjKXPqgpZIa+WlyV9Dqs
	 cm8JGAf21T5rWsfB2nf5dIIkeTKuE+EWFjMz9fD/J4T7aUg3ZSIRg5zx8N4cNpCKPE
	 2a77wIxUeyoXkHDc1sW471fvy6HP6vXqhJG1FqTTWf5qq/QHZOixhcBfcGbFYjhC67
	 rAJaE6312DxCw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 08 Apr 2025 21:04:20 +0200
X-ME-IP: 90.11.132.44
Message-ID: <1dacfce7-c66d-44c6-9a0c-2dd00bc24ffc@wanadoo.fr>
Date: Tue, 8 Apr 2025 21:04:16 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: Fix reference leak in of_i2c_register_devices
To: Sunny <nueralspacetech@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250406134843.67702-1-nueralspacetech@gmail.com>
 <33bf15be-f99a-40c1-a97c-a51ca8fa4c9e@wanadoo.fr>
 <CAGNPQObiZA76gva-+_DY8TtpEiJfLL3QDoONYST4npOSkgZ+5g@mail.gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <CAGNPQObiZA76gva-+_DY8TtpEiJfLL3QDoONYST4npOSkgZ+5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,


first of all, you should not reply with HTML mail, because most mailing 
lists reject such messages.


Le 08/04/2025 à 16:01, Sunny a écrit :
> To clarify, while there is no early exit path in the 
> for_each_available_child_of_node() loop, the reference leak can still 
> occur because the macro increments the reference count for each node 
> it processes. If i2c_new_client_device() fails, the reference count 
> for that node must be explicitly decremented using of_node_put(node). 
> Without this, the reference count remains elevated, leading to a 
> reference leak.

I think you are wrong.

Yes, for_each_available_child_of_node() increments the reference count 
for each node it processes, but it also decrements it at the end of the 
iteration, except when there is an early exit (a break or a return).
See how the 'parent' and 'child' parameters of 
of_get_next_available_child() are used, especially whtat happen with the 
first call with child = NULL.

So should i2c_new_client_device() fail or succeed, 'node' is released 
and the reference count does NOT remain elevated as you state.


If you do not agree, please give more details of how you think it works 
and where the issue is, for exemple with unrolling the loop and noting 
what and when nodes are get and put.

You should then see that it is correct.


The of_node_put(node) you are looking for is there: 
https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/of/base.c#L702

CJ

>
> sunny
>
> On Sun, 6 Apr 2025 at 23:36, Christophe JAILLET 
> <christophe.jaillet@wanadoo.fr> wrote:
>
>     Le 06/04/2025 à 15:48, Sunny Patel a écrit :
>     > Fix a potential reference leak in of_i2c_register_devices where the
>     > reference to the node is not released if device registration fails.
>     > This ensures proper reference management and avoids memory leaks.
>
>     There is no early exit path in the for_each_available_child_of_node()
>     block, so of_node_put((node) is called for all the nodes that are
>     iterated.
>
>     Can you elaborate and explain how the reference leak can occur?
>
>     CJ
>
>     >
>     > Signed-off-by: Sunny Patel <nueralspacetech@gmail.com>
>     > ---
>     >   drivers/i2c/i2c-core-of.c | 1 +
>     >   1 file changed, 1 insertion(+)
>     >
>     > diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
>     > index 02feee6c9ba9..7c50905de8f1 100644
>     > --- a/drivers/i2c/i2c-core-of.c
>     > +++ b/drivers/i2c/i2c-core-of.c
>     > @@ -107,6 +107,7 @@ void of_i2c_register_devices(struct
>     i2c_adapter *adap)
>     >                                "Failed to create I2C device for
>     %pOF\n",
>     >                                node);
>     >                       of_node_clear_flag(node, OF_POPULATED);
>     > +                     of_node_put(node);
>     >               }
>     >       }
>     >
>

