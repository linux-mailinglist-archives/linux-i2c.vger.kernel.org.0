Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91F2346668E
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Dec 2021 16:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347799AbhLBPiB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Dec 2021 10:38:01 -0500
Received: from smtp1.axis.com ([195.60.68.17]:64819 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1358984AbhLBPiA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 Dec 2021 10:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1638459278;
  x=1669995278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yri/mS7tORGYp9z6BnOGZR6MCtrucp5Fel5TYmUSo+s=;
  b=UABW6q4TWVF3kkj8wBAyUgS2h/TYjz9aXihw2mszeeczoougdicB0BiI
   N+Uh8AvKO0IaY3nQRVJs/cfehfYoswD/ziPEcT0KKMEuCE4svJZ2tykFZ
   j0kMxoAjswlz4kCJqbM62U7TwRO8u+cr/YsQpxV3+jzR0LKdOqNMWQj8y
   qrlRiPMB0yZTBGipGpA2dijjIn6GY6ENzfbeIv5KYWs3A9Fup5aMHxvT4
   5v77eQEcy7HF5yq/n/f+vkqXKODKxtzFiO/Fu6y//n2v0UToxc5+Pcq8U
   7UwnEuGKqt19u3FlchLRUSzjVVU1xX3D0655ysmRwJazn8R1b4vA6Hqg9
   g==;
Date:   Thu, 2 Dec 2021 16:34:37 +0100
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     "Michael S. Tsirkin" <mst@redhat.com>
CC:     "jie.deng@intel.com" <jie.deng@intel.com>,
        "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "wsa@kernel.org" <wsa@kernel.org>, kernel <kernel@axis.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "conghui.chen@intel.com" <conghui.chen@intel.com>
Subject: Re: [PATCH v2 2/2] i2c: virtio: fix completion handling
Message-ID: <20211202153436.GA11644@axis.com>
References: <20211111160412.11980-1-vincent.whitchurch@axis.com>
 <20211111160412.11980-3-vincent.whitchurch@axis.com>
 <20211111114630-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211111114630-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 11, 2021 at 05:57:30PM +0100, Michael S. Tsirkin wrote:
> On Thu, Nov 11, 2021 at 05:04:12PM +0100, Vincent Whitchurch wrote:
> > -	wait_for_completion(&vi->completion);
> > +	/*
> > +	 * We only need to wait for the last one since the device is required
> > +	 * to complete requests in order.
> > +	 */
> 
> Hmm the spec only says:
> 
>     A device MUST guarantee the requests in the virtqueue being processed in order
>     if multiple requests are received at a time.
> 
> it does not seem to require using the buffers in order.
> In any case, just waiting for all of them in a loop
> seems cleaner and likely won't take longer ...

Thank you, I've fixed this in v3.
