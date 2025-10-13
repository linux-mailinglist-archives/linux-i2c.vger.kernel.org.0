Return-Path: <linux-i2c+bounces-13462-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A069BD11DC
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Oct 2025 03:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A54933B5A2E
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Oct 2025 01:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1DD26D4DF;
	Mon, 13 Oct 2025 01:52:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF9CC8F0;
	Mon, 13 Oct 2025 01:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760320322; cv=none; b=mwGsGblIRpy9GJjhw8A7h15NCR9BG6psGhRcmt4TTDwyrJSzdPVZK6Ic67NJYOK2i5qqH22rggeFTI0YDgMMAzeMHaiuTJGqo8bRIkd2NCbEd0bsNmw9CSnzB+/Uwhyd2b58PPzvJQ3VLadu9EMHBBFvj9xbqIVmNfGlRTWK1Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760320322; c=relaxed/simple;
	bh=JLOWSnpx0Jx+4ousG6zxmvmc2gs76d7SbTqSNRPCIXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGucXtd10GgY9HiF+9f/By0XIGj+QiCGctEpW74rzBuYtlyGRZc86yEMsWPmk49g4JrJ+CQ8rW/Ew/ju8zPkjjWwrHeVc+wjLX1ZhlXcOz3Ew2B2/fCte7hPzOuDePts1wI/wp8Bt83IsITd6jMtJEkaaO9Cs3jOc7yr5cErrQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-c45ff70000001609-f8-68ec5b3b579e
Date: Mon, 13 Oct 2025 10:51:49 +0900
From: Byungchul Park <byungchul@sk.com>
To: Mark Brown <broonie@kernel.org>
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
	matthew.brost@intel.com, her0gyugyu@gmail.com, corbet@lwn.net,
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
	kevin.brodsky@arm.com, dwmw@amazon.co.uk, shakeel.butt@linux.dev,
	ast@kernel.org, ziy@nvidia.com, yuzhao@google.com,
	baolin.wang@linux.alibaba.com, usamaarif642@gmail.com,
	joel.granados@kernel.org, richard.weiyang@gmail.com,
	geert+renesas@glider.be, tim.c.chen@linux.intel.com,
	linux@treblig.org, alexander.shishkin@linux.intel.com,
	lillian@star-ark.net, chenhuacai@kernel.org, francesco@valla.it,
	guoweikang.kernel@gmail.com, link@vivo.com, jpoimboe@kernel.org,
	masahiroy@kernel.org, brauner@kernel.org,
	thomas.weissschuh@linutronix.de, oleg@redhat.com, mjguzik@gmail.com,
	andrii@kernel.org, wangfushuai@baidu.com, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
	rcu@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v17 09/47] arm64, dept: add support
 CONFIG_ARCH_HAS_DEPT_SUPPORT to arm64
Message-ID: <20251013015149.GC52546@system.software.com>
References: <20251002081247.51255-1-byungchul@sk.com>
 <20251002081247.51255-10-byungchul@sk.com>
 <a7f41101-d80a-4cee-ada5-9c591321b1d7@sirena.org.uk>
 <20251003014641.GF75385@system.software.com>
 <b69ab7d0-ba5e-4d22-88ef-53e0ebf07869@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b69ab7d0-ba5e-4d22-88ef-53e0ebf07869@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02SW0hTcRzH+Z/bjqvBaVn9y54mYhdWLXv4QRfqITpRSSA9lKCNPLjltXkp
	g0Aty8RqLVY5W00jWzqxpmVhg9LsYmiWJidxpl2cS82Yrou3tZNEvX34fS+/38OPJZVt9BJW
	n5opGFK1ySpGTslH5par18cO69Z0N6ihK+8RBVdqHAy89xciKHgQoGDa9FQGF1+bSHDU5REw
	1ORDcMmbR4G3eRsE3B4Cpi8mwbXyWgYumdsR1D3tReCy5zPQ6R9lwJbvosFaakJQ5dwVDDJQ
	kRsBU/0aCNjSwH3OTEF9bp8MnO+aEYx39hPgKB4gwdW9Ekqu9jBQOD2OoPj2XRp6HQEa+vtE
	GkTjZwSmAV8w5ehiwGOxEtDkHyagxT0mgwtvbAy0TLQQ4LPO0GCeKmSgeroLwVfjOA2lzb2y
	zWt4x1UH4icnTIhvGh4l+Qn/W4ZvKcf8+VY1/8DilvE2ZxZ//aGX4Mt8fprvHtrIOytPM7zT
	Z5LxPV0PGf5rW5uMf355ktodtk++IUFI1mcLhtWb9st1w8+2ph/HR6o+fkO56KyyCLEs5tbh
	z760IhTyB1s9AzKJKS4CB4oGaYkZLhKL4i9S4lAuHL/94aKKkJwlubIwfHOk5o9pPhePp251
	EhIrOMD5r9y0ZFJyAYQ722vJWWEeflHyiZKY5FZgccZLSEeQXLBohpXGIdwW/OmEmZF4QXDZ
	o3vPiNnjekNwnztnlhfjx3aRMiLO8l+r5b9Wy79WGyIrkVKfmp2i1SevW6XLSdUfWXUgLcWJ
	gl9WcWwq9j7ytcc0Io5FqrkKXcOQTklrszNyUhoRZklVqOL8yUGdUpGgzTkqGNLiDVnJQkYj
	CmMp1SLF2u+HE5RcojZTSBKEdMHwVyXYkCW5KLJKE6Pes9sYGrDENbgOL/si2g5mjix6qb+1
	feGd4ihrdF+SF3zdnl0VBbUvrafEjl91PTuqj2kil3vslZODZa6zJ6OWNmVfUEfds9hvzPsZ
	0ywmjnVE168+FPcj651mg/GJe+flMx/Me1vHNGdiXbcr7D0RxfHLDIOio3/LnHBGRWXotJoV
	pCFD+xupLkPHYQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0yTZxTHfd47zTrfVdA3EkOsIUYTnRovJ14WjTE+LupM/GA2P2inb2xD
	KdgqiIkGKN0QF4UmLfMtTIRQkTJhhZl1rIbgRAWRuxChIlopSCteQIJcurcuRr+c/M7z///P
	cz4cjlTN0As5neGEaDRo9GpGQSn2bjKv2HQwqF1VWq6Ahxl1FIyPZVNQUFnBQLb7Eg2t110I
	+sezEUxMOUiweMIUzFgbWBib7GUh7G1AYG+zklBRk0HA26pZBkZuvUFgG/AzkD+cQcGo8xcE
	0qCDheHbOyHUX0tD2BcgoPtdEIHTP0uAv+5nBDP2BLhcXM3AVHMLCfm2VgRXBnwkDFXJYk3D
	YwTeskwGnuf+SUKH/0voHB9l4J7tPAOhtgICXlYxUJTppaHQYUVgLqlkwF7opsDz5G8W2kam
	CeizWwlwufdAv3OQgqbcYkLeT3b9sQAc+WZCLkME2H6vJWDSWc7C/ZI+Cpzp8eBo7qDhaZnE
	wvTAaggXJUGDK8CC76KNguuhFnqrDeEJywUKl1ffILClfYbBFb9VIDz13orwWKmZxJZcub0V
	HCVxVnUqLm0KMvj9eBeDve+KKNxYLOC85hXYI/lYnHXzEbtv4w+KzUdFvS5FNH79zWGFNnhn
	R7JZOOV69gqlowuqHBTFCfxaoTkwyEaY4uOFcM4QHWGGXyr09EySEY7mlwhdE14qByk4kr8S
	K1wNVX4wzeMPCdPXOokIK3kQMlt8dMSk4sNI6GytJv8XvhLuXfJTESb55ULP7LAc4GSWB81y
	kecofpvgz7IxEY6RP6u7cYfIRUrps7T0WVr6lC5CZDmK1hlSEjU6/bqVpgRtmkF3auWRpEQ3
	ko/SeWY67y801rGzHvEcUn+h1NaOaFW0JsWUlliPBI5URyvzfhrSqpRHNWmnRWPSIeNJvWiq
	R7EcpV6g/PaAeFjFH9OcEBNEMVk0flQJLmphOtqyL9aUsrXpReD1j3MPPugrJq5Z58Sp46yY
	llKzFz/E27/b37X+eKOU/CB0Zvuyf580rrGUakpiPJ6ClwPtF1N72zNvikvtJ2Pchrqzc7o9
	Umq3MN+2N3D82OVld2tuq3b/s+qIcX9h/AZXxq/DfecHF0m9qu93nauN2xzQPy9r0+5SUyat
	ZvVy0mjS/Afz91sZkAMAAA==
X-CFilter-Loop: Reflected

On Fri, Oct 03, 2025 at 12:33:03PM +0100, Mark Brown wrote:
> On Fri, Oct 03, 2025 at 10:46:41AM +0900, Byungchul Park wrote:
> > On Thu, Oct 02, 2025 at 12:39:31PM +0100, Mark Brown wrote:
> > > On Thu, Oct 02, 2025 at 05:12:09PM +0900, Byungchul Park wrote:
> > > > dept needs to notice every entrance from user to kernel mode to treat
> > > > every kernel context independently when tracking wait-event dependencies.
> > > > Roughly, system call and user oriented fault are the cases.
> 
> > > > Make dept aware of the entrances of arm64 and add support
> > > > CONFIG_ARCH_HAS_DEPT_SUPPORT to arm64.
> 
> > > The description of what needs to be tracked probably needs some
> > > tightening up here, it's not clear to me for example why exceptions for
> > > mops or the vector extensions aren't included here, or what the
> > > distinction is with error faults like BTI or GCS not being tracked?
> 
> > Thanks for the feedback but I'm afraid I don't get you.  Can you explain
> > in more detail with example?
> 
> Your commit log says we need to track every entrance from user mode to
> kernel mode but the code only adds tracking to syscalls and some memory
> faults.  The exception types listed above (and some others) also result
> in entries to the kernel from userspace.

You're right.  Each kernel mode context needs to be tracked
independently.  Just for your information, context ID is used for making
DEPT only track waits and events within each context, preventing
tracking those across independent contexts to avoid false positives.

Currently, irq, fault, and system calls are covered.  It should be taken
into account if any other exceptions can include waits and events anyway.

> > JFYI, pairs of wait and its event need to be tracked to see if each
> > event can be prevented from being reachable by other waits like:
> 
> >    context X				context Y
> > 
> >    lock L
> >    ...
> >    initiate event A context		start toward event A
> >    ...					...
> >    wait A // wait for event A and	lock L // wait for unlock L and
> >           // prevent unlock L		       // prevent event A
> >    ...					...
> >    unlock L				unlock L
> > 					...
> > 					event A
> 
> > I meant things like this need to be tracked.
> 
> I don't think that's at all clear from the above context, and the
> handling for some of the above exception types (eg, the vector
> extensions) includes taking locks.

A trivial thing to mention, each typical lock pair, lock and unlock, can
only happen within each independent context, not across different
contexts.  So the context ID is not necessary for typical locks.

   exception X

   lock A;
   ...
   unlock A; // already guarateed to unlock A in the context that lock A
             // has been acqured in.
   ...
   finish exception X and return back to user mode;

But yes, as you concern, we should take into account all the exceptions
if any can include general waits and events in it, to avoid unnecessary
false positives.

Thank you!

	Byungchul

