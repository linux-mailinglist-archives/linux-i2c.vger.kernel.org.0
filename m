Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0587C1D7FBD
	for <lists+linux-i2c@lfdr.de>; Mon, 18 May 2020 19:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgERRLU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 May 2020 13:11:20 -0400
Received: from smtprelay0009.hostedemail.com ([216.40.44.9]:47312 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727006AbgERRLU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 May 2020 13:11:20 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id DDE31100E7B40;
        Mon, 18 May 2020 17:11:18 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3871:4321:5007:7576:7903:10004:10400:10848:11026:11232:11658:11914:12043:12296:12297:12438:12555:12740:12760:12895:12986:13069:13255:13311:13357:13439:14096:14097:14181:14659:14721:21080:21451:21627:30054:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:3,LUA_SUMMARY:none
X-HE-Tag: badge74_7fac34a359a27
X-Filterd-Recvd-Size: 2431
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf08.hostedemail.com (Postfix) with ESMTPA;
        Mon, 18 May 2020 17:11:17 +0000 (UTC)
Message-ID: <06434e4d5980b17a1cacee80369087cbd7a8cbe0.camel@perches.com>
Subject: Re: [PATCH][next] i2c: mediatek: fix integer overflow on an integer
 multiplication
From:   Joe Perches <joe@perches.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Colin King <colin.king@canonical.com>, qii.wang@mediatek.com
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 18 May 2020 10:11:16 -0700
In-Reply-To: <20200518165928.GA5109@ninjato>
References: <20200518165529.57821-1-colin.king@canonical.com>
         <20200518165928.GA5109@ninjato>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 2020-05-18 at 18:59 +0200, Wolfram Sang wrote:
> On Mon, May 18, 2020 at 05:55:29PM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Currently the calculation of sample_ns is using a 32 bit integer
> > multiplication and can potentially overflow. Fix this by making the
> > constant a long long to use a 64 bit multiply and hence
> > avoid an overflow.
> > 
> > Addresses-Coverity: ("Unintentional integer overflow")
> > Fixes: 5f1ae73d538a ("i2c: mediatek: Add i2c ac-timing adjust support")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> CCing the patch author.
> 
> > ---
> >  drivers/i2c/busses/i2c-mt65xx.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> > index 702061805925..c93492b997ce 100644
> > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > @@ -551,7 +551,7 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
> >  	const struct i2c_spec_values *spec;
> >  	unsigned int su_sta_cnt, low_cnt, high_cnt, max_step_cnt;
> >  	unsigned int sda_max, sda_min, clk_ns, max_sta_cnt = 0x3f;
> > -	long long sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src;
> > +	long long sample_ns = (1000000000LL * (sample_cnt + 1)) / clk_src;

unsigned long long?


