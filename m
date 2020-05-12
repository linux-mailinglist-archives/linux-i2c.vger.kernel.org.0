Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAD1D1D02DE
	for <lists+linux-i2c@lfdr.de>; Wed, 13 May 2020 01:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgELXH1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 19:07:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:41606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726031AbgELXH0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 May 2020 19:07:26 -0400
Received: from embeddedor (unknown [189.207.59.248])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0BB1E20740;
        Tue, 12 May 2020 23:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589324846;
        bh=q70NZxHcRsNssy2yK4Oj0k72CRfKxZngvQV/WYT7HZo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=x+xi096T+/ETKpnanwq+wLz663+KHQNMu0OzKd6/WYKdL1fENTVqpsXRpW4OdKmoi
         6Vf05oKEamrY01jzGPwl/RDlnhbM+L9bIoFTD01F2ON3sgAqhz81/0zKYfsLHj/mT5
         JgFjUUVfzoAhNQM3TeQnQ6UvU6aOnNy02BRkcyw4=
Date:   Tue, 12 May 2020 18:12:00 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: Replace zero-length array with flexible-array
Message-ID: <20200512231200.GL4897@embeddedor>
References: <20200507185329.GA14436@embeddedor>
 <20200512104319.GH1393@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512104319.GH1393@ninjato>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 12, 2020 at 12:43:19PM +0200, Wolfram Sang wrote:
> > 
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Applied to for-next, thanks! Gustavo, let me know if you think it should
> be in for-current.
> 

Hi Wolfram,

If that's not much work for you, then it'd be great if you include
it for 5.7. :)

Thanks
--
Gustavo
