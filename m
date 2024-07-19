Return-Path: <linux-i2c+bounces-5036-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62385937D20
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jul 2024 22:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15D541F21F9F
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jul 2024 20:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADDD148308;
	Fri, 19 Jul 2024 20:03:48 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail2.medvecky.net (mail2.medvecky.net [85.118.132.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CF74174C;
	Fri, 19 Jul 2024 20:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.118.132.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721419428; cv=none; b=IHSABK1XYw4LyGKQaaR4RmH09iAIq+RmpOOz1j2SvGj200ypDAncrwvB2bY0aLu7YBCU0zW8HhfI5zLB981PPIx5XPC8Z80vJYgY9gwajwnuuWNpK35OrFrg1rGZ4Di8peOlS+SUwJEAL3JTL8NgAhx3XXKqlf6qo6Tfjko7xeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721419428; c=relaxed/simple;
	bh=N4zeZxJbjnfV3n2Jic6aIeMZJLw6qLDnJSTkZDfypLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AtoOU+rYVX7w1uRtMO3wAi4i/xYBcCchlQE7nwcV9yt1z65tVSuhzBuMzNe4yRIEAaoEWQl7OEW3+BOWtpcjUcv1PTyupzVQ/b7RrN72fL3Kj1o9DJ2Gk8bEt90kxz7cH86pBpA6dCD6g0wluETB/ZEq/FafxpPbIP9xNJR5e3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=assembler.cz; spf=pass smtp.mailfrom=assembler.cz; arc=none smtp.client-ip=85.118.132.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=assembler.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=assembler.cz
Message-ID: <b3d6d20d-1b14-447f-a6b2-aa7712df1156@assembler.cz>
Date: Fri, 19 Jul 2024 21:59:37 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] mm: vmalloc: export __vmalloc_node_range
To: Mary Strodl <mstrodl@freedom.csh.rit.edu>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
 urezki@gmail.com, linux-mm@kvack.org, lee@kernel.org, andi.shyti@kernel.org,
 linux-i2c@vger.kernel.org, s.hauer@pengutronix.de
References: <ZpiGIbczW4iItKVx@infradead.org>
 <ZpkNOyuxuJHaTW35@freedom.csh.rit.edu>
 <ZpkOV3mdOU1b8vMn@casper.infradead.org> <ZpkPStwq_S3mJYb5@infradead.org>
 <ZpkQQ5GzJ4atvR6a@casper.infradead.org>
 <ZpkWj-iFiA-JHbbf@freedom.csh.rit.edu>
 <20240718143103.82e33c556b2d1b6145ae43e0@linux-foundation.org>
 <ZpmKho9_t0_MeOP7@casper.infradead.org>
 <20240718143924.43e22f68cf639b064a83f118@linux-foundation.org>
 <CAH9NwWf_S-PyY5X_cJGSW-8YDk4-C0VvnPCX8iVuo0FhTqsy2Q@mail.gmail.com>
 <ZppU8FhsFd9cB-Fi@freedom.csh.rit.edu>
Content-Language: en-US
From: Rudolf Marek <r.marek@assembler.cz>
Autocrypt: addr=r.marek@assembler.cz; keydata=
 xsBNBFN2VH4BCADpv+3Tkikr+X489Xso9UC719YdxgGiy0xBjDiWC22wAd3tHy6G3nEhWfh4
 1UNGcqscPAvJMn2GhgSJRfBzj0wALXLkoTYta78wEK+Ji+Gs7PX9VhqRKt9/OIn/2XJ1Yv9i
 e8uo9MFBGFCB5roz+Ws8rdXq0Quu7VZylzRv7qqhxMAk9RvXCT2tyt6XY16R7ZEL9wbSLRAl
 h8LRPMF0iiLH1YenfSCX2XkW7eA7CJSjh9pwIBFOF5cd5mcT69OPO+TuAbdvgCcZPEoQQBhk
 QmOr2PlUOl3CSgqtTxjAjAxXhPTU7Q3xxgB2Oa7xbt3Eic2Z4lltP/dowULZqXvsC5DxABEB
 AAHNI1J1ZG9sZiBNYXJlayA8ci5tYXJla0Bhc3NlbWJsZXIuY3o+wsCVBBMBCgA/AhsjBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBJmYg4ih63dUUwlgxcBvbatkz11wBQJlPgBlBQkT
 qcLyAAoJEMBvbatkz11wpS8IAKfdkPa//5qGNFsAhRwLGnUIGSg43axFwFMAFkwxbMF9a3C7
 u5amel/bxeTHAahAsP3CTEZ0W+mDmBBCYk5tJLnWozwxA9mn03uNX460FUkO0kHMwA0TEfdP
 Puw/CPQSb32bDh4L1WQTXskhaDqAeQrefKFdT0Ty9Kv7HNEn8HnyMJopLOB4punq6rCOQtFV
 0LooO2s/D6BJsfm+oTfGvtQqc0bq0yAhF3YN24Pen3MEWzGdkfjXbIbqYQg9GEUAoKtzvjTo
 Yqwts3exIEyhOAix1hXq3boQ6/4dV9pKzzLzKK/dUoxuBwavRcxYD3DaMjrwDR1rQYxH5qgE
 Ps+qr/vOwE0EU3ZUfgEIAOyD3W4D+aaXoA875pbKqSI+MQ2t5PYNPaCahoSSnTuNmvM1xCsv
 I2EaGwfr5S0IktX1g0dt8lvvCx9eZeEhGH5NBgsmWtTi0Gq9UHQXbj4wQAV23/X+MCZqKFFl
 Yp0T86C23RhXsEQp8mTYpnGsbjAsHgaDnuQj5pWahVGXv9aYzjomk4mEGq8jr8/D9kgOEll+
 s5cIJYzeliPHR+2SRQs+XoTp1e/dXs310xXhuo2Pg8N/Kym0WhWjTYBuUeoyaYFDYtwj6jkc
 2baI/JOSUoyarxnmRuVcNHoZd7as7lzmPS9Dqrm5LJVrfQk0lx+XaJRPZqQW/uf5FFaGXIIi
 2OkAEQEAAcLAhgQYAQoAJgIbDBYhBJmYg4ih63dUUwlgxcBvbatkz11wBQJlPgBlBQkTqcLy
 ABQJEMBvbatkz11wCRDAb22rZM9dcCdyB/0WxmhGjV70aLxVu7SXDEF9RYw2k2NwGs0GWLrr
 cO4h9M5nx+gZvKUcrUPYOBOUscUSVBOEdIzke+vtFtHeio7a3lQ5OVQ6ppBnSm3p9T8/R0lW
 9Cuqo5Rv0EZQuas2Ocsklj0bAZ3VQavxX7jxgQPw4ko2fgTb5vY1zNH+tl3IF80ZmwZtfwB8
 qvapHWpMgLT23VnE+smwfc+9qDSiQe/f0bV5Oo8Iu8srrWqyNvRbQZtT9mqfxyY0qKAJZEc8
 iNY3naVK3VI8ZhPoJhMdPp+y7centQof+WsJZhROdpmD2hW4k41alBPABpMW7YS8L/KNyrks
 GYdjeACh724J4qrf
In-Reply-To: <ZppU8FhsFd9cB-Fi@freedom.csh.rit.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Bar: +
Authentication-Results: mail2.medvecky.net;
	auth=pass smtp.mailfrom=r.marek@assembler.cz
X-Spam-Level: *

Hi,

Dne 19. 07. 24 v 13:58 Mary Strodl napsal(a):
> I think this is good discussion, thanks for sharing your thoughts
> everybody.

I would suggest to simply run the BIOS code of this interface in usermode. Sort of similar to VM86 VESA stuff.
Last time I looked into this it used STI/CLI/RDMSR/WRMSR and couple of I/O ports and cf8/cfc for PCI.

Thanks,
Rudolf


