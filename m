Return-Path: <linux-i2c+bounces-863-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAF2818587
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 11:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E340287F31
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 10:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450F714AB6;
	Tue, 19 Dec 2023 10:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="CTXmnvAx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E2314AA1;
	Tue, 19 Dec 2023 10:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=m0yDNQUTzvodWEDvtBbstPo3KYaYH/E7fv3GZp8yaBg=; b=CTXmnvAx0w2obrey6tf4Jym2mq
	OK5pluK9R8CymBcfGvC7I3dEqZ4bqt218V2kKYdrgOnDGE11zCVwiorsjZADS2GteC/9Lc/48P8eG
	T++PXSZlxH/d3jTAbtjejmLzrsyAVI2Ci/2j7fbcjvqezt6fu65f/qrkyszFweFLOHueA579GMYzn
	+qN/SJCh4065efueYNaGtKElN98/+J84H6B/0cwyKANngiqctw1Ow4fXdXxD0E27uTGka2V+2h/Zk
	z3sAtHfxbu2p/IEAHJUKQY/sy3rS+xD37iRzpNGZ2z9PcJUDK+v+YDdyGg8KrCDe7fU80uMK//BEd
	TGXIm3+Q==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1rFXe6-000KUe-D3; Tue, 19 Dec 2023 11:48:18 +0100
Received: from [80.62.117.166] (helo=localhost)
	by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <esben@geanix.com>)
	id 1rFXe5-00051Z-Je; Tue, 19 Dec 2023 11:48:17 +0100
From: esben@geanix.com
To: Gregor Herburger <gregor.herburger@ew.tq-group.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Andi Shyti <andi.shyti@kernel.org>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,  Fabio
 Estevam <festevam@gmail.com>,  NXP Linux Team <linux-imx@nxp.com>,
  "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
  "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,  "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,  "linux@ew.tq-group.com"
 <linux@ew.tq-group.com>
Subject: Re: [PATCH] i2c: i2c-imx: allow bus recovery on non-muxable pads
In-Reply-To: <ZYFpUpP0Ll5c99py@herburgerg-w2> (Gregor Herburger's message of
	"Tue, 19 Dec 2023 10:58:42 +0100")
References: <20231218-i2c-imx-recovery-v1-1-f69fa85b228c@ew.tq-group.com>
	<87frzyprhq.fsf@geanix.com> <ZYFpUpP0Ll5c99py@herburgerg-w2>
Date: Tue, 19 Dec 2023 11:48:17 +0100
Message-ID: <877clapixa.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27128/Tue Dec 19 10:36:48 2023)

Gregor Herburger <gregor.herburger@ew.tq-group.com> writes:

> Hi Esben,
>
>> Why not move to use the generic GPIO recovery instead?  Will something
>> like this be able to cover at least the same scenarios as your change?
>
> I was not aware of the generic GPIO recovery functions. At a first
> glance I think your solution should work. I will give it a try and test
> it on hardware.

Great. Let me know if it works for me. If it does, I guess I should send
the patch to the list in it's own thread.

/Esben

