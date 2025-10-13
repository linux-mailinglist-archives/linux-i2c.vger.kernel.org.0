Return-Path: <linux-i2c+bounces-13460-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51607BD112A
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Oct 2025 03:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 936561894FB4
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Oct 2025 01:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842C01EDA2B;
	Mon, 13 Oct 2025 01:18:42 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48D612B94;
	Mon, 13 Oct 2025 01:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760318322; cv=none; b=Q9aoteCNeoZf8VI+3K2woke2DkGmcDOgt3cNjVwuBnLrr8LAkWaJAKW7LbgTMN8H2JoTdnFr9juD8oAgp1+JUSaAOb09wbQM/7RLNflCg3tBINJV0VXWa4kTIgiOGCeYEAJGvdxILJ1dcqFkdI+Ez0IL6A8jUr9xkgVIdBb5Zy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760318322; c=relaxed/simple;
	bh=NiasNDnL7bI+RWAs1WgZxXifIHYVm8cB4osG/bTqMcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHSaoesihppeT2n1hGOeCFjJA9l1DOwhA3UjLXJlu+pwTSyXs4yPQnHE3a1UZhPZ/JJ5PDFTTZTXDKlslIGXSVpEETgPHDfUwhkeowRVxx9LnTV21iL3NplYOQ8jZxmGaLwLEFke+g2R8bnxwR4CDEaiehrKqSJRy7yzkM792H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-c45ff70000001609-66-68ec4fde3b26
Date: Mon, 13 Oct 2025 10:03:21 +0900
From: Byungchul Park <byungchul@sk.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, kernel_team@skhynix.com,
	torvalds@linux-foundation.org, damien.lemoal@opensource.wdc.com,
	linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
	linux-ext4@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
	will@kernel.org, tglx@linutronix.de, rostedt@goodmis.org,
	joel@joelfernandes.org, sashal@kernel.org, daniel.vetter@ffwll.ch,
	duyuyang@gmail.com, johannes.berg@intel.com, tj@kernel.org,
	tytso@mit.edu, willy@infradead.org, david@fromorbit.com,
	amir73il@gmail.com, gregkh@linuxfoundation.org, kernel-team@lge.com,
	linux-mm@kvack.org, akpm@linux-foundation.org, mhocko@kernel.org,
	minchan@kernel.org, hannes@cmpxchg.org, vdavydov.dev@gmail.com,
	sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
	penberg@kernel.org, rientjes@google.com, vbabka@suse.cz,
	ngupta@vflare.org, linux-block@vger.kernel.org,
	josef@toxicpanda.com, linux-fsdevel@vger.kernel.org, jack@suse.cz,
	jlayton@kernel.org, dan.j.williams@intel.com, hch@infradead.org,
	djwong@kernel.org, dri-devel@lists.freedesktop.org,
	rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
	hamohammed.sa@gmail.com, harry.yoo@oracle.com,
	chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
	max.byungchul.park@gmail.com, boqun.feng@gmail.com,
	longman@redhat.com, yunseong.kim@ericsson.com, ysk@kzalloc.com,
	yeoreum.yun@arm.com, netdev@vger.kernel.org,
	matthew.brost@intel.com, her0gyugyu@gmail.com,
	catalin.marinas@arm.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, luto@kernel.org,
	sumit.semwal@linaro.org, gustavo@padovan.org,
	christian.koenig@amd.com, andi.shyti@kernel.org, arnd@arndb.de,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	rppt@kernel.org, surenb@google.com, mcgrof@kernel.org,
	petr.pavlu@suse.com, da.gomez@kernel.org, samitolvanen@google.com,
	paulmck@kernel.org, frederic@kernel.org, neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com, josh@joshtriplett.org, urezki@gmail.com,
	mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
	qiang.zhang@linux.dev, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	chuck.lever@oracle.com, neil@brown.name, okorniev@redhat.com,
	Dai.Ngo@oracle.com, tom@talpey.com, trondmy@kernel.org,
	anna@kernel.org, kees@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, mark.rutland@arm.com, ada.coupriediaz@arm.com,
	kristina.martsenko@arm.com, wangkefeng.wang@huawei.com,
	broonie@kernel.org, kevin.brodsky@arm.com, dwmw@amazon.co.uk,
	shakeel.butt@linux.dev, ast@kernel.org, ziy@nvidia.com,
	yuzhao@google.com, baolin.wang@linux.alibaba.com,
	usamaarif642@gmail.com, joel.granados@kernel.org,
	richard.weiyang@gmail.com, geert+renesas@glider.be,
	tim.c.chen@linux.intel.com, linux@treblig.org,
	alexander.shishkin@linux.intel.com, lillian@star-ark.net,
	chenhuacai@kernel.org, francesco@valla.it,
	guoweikang.kernel@gmail.com, link@vivo.com, jpoimboe@kernel.org,
	masahiroy@kernel.org, brauner@kernel.org,
	thomas.weissschuh@linutronix.de, oleg@redhat.com, mjguzik@gmail.com,
	andrii@kernel.org, wangfushuai@baidu.com, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
	rcu@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v17 28/47] dept: add documentation for dept
Message-ID: <20251013010321.GA52546@system.software.com>
References: <20251002081247.51255-1-byungchul@sk.com>
 <20251002081247.51255-29-byungchul@sk.com>
 <87ldlssg1b.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldlssg1b.fsf@trenco.lwn.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa2xLYRjH8557G7Wjbi+ND+oWwzbiw/NBXOJ2hCAk4hpO7EQb3UjH2Fhi
	MjVzqy626EzGhtpq6MxmVGbXLLbqZqZmVruobbSJmY6xhTMRvv3yf/75Pc+HhyPVDfRETh99
	QDJGiwYto6SU/hHX5njXfdJFBGvGQlNiKQX9PzJIGLRUsZBWbyHBfj+RgIttnQxYfRksdFeu
	BL/3EQ2vgp8QpF90I3DajjPw3lxIQuAuA1nHnTSkZTooePiuhIWWNAsB3hs+CmqzWyj42TYX
	alqbaPBWm2joa2wjwH7GR4KzeRYkD/YhqCpuJ6Ahz03B85LbNFx/VU9A8JwG3BfO0pAa8CGw
	+HpZMH0ZoqH6bCkBdRkuGlrO9VBgyrlHQMWdIgKu2/w0DLwtpuH0iTQKkiuCJBRW9rOQ+MWL
	IGDuoxdHCCcaBhnBfsWOhB8DFiQ8tL5lhSzHQSGpwk8LBbZQIftxNyE4ck8xQoq/kRBamh4z
	QsDlYoXOxnRCeDPUQQpdBZeQ8Pl9M7V+/FblgkjJoI+VjOELdyl15c5Wan82c9jWueEYMtEp
	SMFhfj4OfC1lUxA3zJ6rRjmm+Gm4dqCQkZnhZ2CP5zspV8bwU3HPqU0pSMmR/E0NTvVlDndG
	84uw66UdyaziAWfWlw+zmk9C+HOt+CcfhWsudVIyk3wo9gx1E7KT5DX45hAnxwp+Nu43t5My
	j+Wn4NIH1YS8C/M+Bb6c2Ir+nDwBP7V5KDPirf9prf9prf+0WYjMRWp9dGyUqDfMD9PFResP
	h+3eF+VAvz/tRsLPbcWo172xDPEc0o5Q6R591KlpMTYmLqoMYY7UjlFdMHXp1KpIMS5eMu7b
	aTxokGLKkIajtONV84KHItX8HvGAtFeS9kvGv1OCU0w8hpTT67xosL2D7uppWDp77a5NJx3z
	NEnqcbdWxJqn561cHlblNoanJ0z9Fv68K/7I69bXmi27paJlCQUvaotylWsUzSXe/MuTR98R
	DQs8YIiYZDB/WN0b8q48dceVkUtyvjZHLtdsT161In9vZcjMujNPnp6XnnUfrXKyt1zB+JDN
	wQ4tFaMT54aSxhjxFy7b3xBlAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxbZRTHfe7Lc28bO68VtycjfrDuJRJBl+k8cUaXqNkNUXQz2Xxjrt2u
	tuGlyy3D4WLCWxFxaqlp2dp1MtgKgbJ1BRaRdEEaWbaBDJFRdYV1qQxGkaiwhgLFdsa4Lye/
	8z///8n5cHhaHWfX8obCIkku1OZrsJJR5mytyBx7Pap/ytWWBdfKehiYn6tm4PhZD4Zq3zEW
	rp5pRTA+X40gtuikwdy1wsCytY+DuYXfOFjx9yGwD1lp8HSUUfC3N4FhOvAXAls4gqFuqoyB
	WfcRBI4JJwdTP2yHmfFuFlZCtygYvRNF4I4kKIj0fIpg2Z4H3zS0Y1gcGKShznYVwclwiIZJ
	b3LY0TeGwN9cjuF3SycNw5FV8PP8LIZLts8xzAwdp+APL4b6cj8LLqcVQUXjWQx2l4+Brhvf
	cTA0vUTBdbuVglbfazDunmDgiqWBSt6XdJ1bA866CipZJimwtXVTsOBu4aC/8ToD7tL14BwY
	ZuFms4ODpfAmWKk3Ql/rLQ5CX9kYODMzyG6zITFm/pIRW9rPU6L5p2Usek54kLgYtyJx7nQF
	LZotyTYQnaXFyvaPxNNXoliMz49g0X+nnhEvNxCxdiBT7HKEOLHywq/cG8+9o3x+v5RvKJbk
	J1/Yq9QH/GPMgUZ8qDmysxRVsTWI54nwNAmelGuQgmeE9aQ/3olTjIWNJBhcoFOWNGEduf3Z
	rhqk5GmhKZ18PeG663lIeJH8OOJBKVYJQFxDgbusFioR+bNf+6/+ILl0LMKkmBYySDAxRaV2
	0kI6aUrwKVkhPEFilpt0ih8WHiM95y9SFqRy3JN23JN2/J+uR3QLSjMUFhdoDfnPZJny9CWF
	hkNZ+4wFPpT8SPcnS7Xfornh7b1I4JHmfpW+e1qvZrXFppKCXkR4WpOmqq2a1KtV+7UlH0uy
	8X35YL5k6kXpPKNZo8reLe1VCx9qi6Q8STogyf9NKV6xthS5r+VIl2U245eD0cAjh+/b4jWe
	em/j6Pe6dFfuznc/CDlWb6jLzlzep9PZSXlr7aPPvt0SfOXwjuwLqzdn9DpHXlLciK17tWkC
	F9U8MCX4ir2d4qqcPbmzm31HwqNuz+Dtl+UtRp05trVKEX/z8Q7YlgiVNOTKF0+95Qwf5dp0
	G77QMCa9dlMGLZu0/wCekX8tjQMAAA==
X-CFilter-Loop: Reflected

On Thu, Oct 02, 2025 at 11:36:16PM -0600, Jonathan Corbet wrote:
> Byungchul Park <byungchul@sk.com> writes:
> 
> > This document describes the concept and APIs of dept.
> >
> > Signed-off-by: Byungchul Park <byungchul@sk.com>
> > ---
> >  Documentation/dependency/dept.txt     | 735 ++++++++++++++++++++++++++
> >  Documentation/dependency/dept_api.txt | 117 ++++
> >  2 files changed, 852 insertions(+)
> >  create mode 100644 Documentation/dependency/dept.txt
> >  create mode 100644 Documentation/dependency/dept_api.txt
> 
> As already suggested, this should be in RST; you're already 95% of the
> way there.  Also, please put it under Documentation/dev-tools; we don't
> need another top-level directory for this.

Sure.  I will.  Thanks!

	Byungchul
> 
> Thanks,
> 
> jon

