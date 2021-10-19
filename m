Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8D64330F6
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Oct 2021 10:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234558AbhJSIY1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Oct 2021 04:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234132AbhJSIY0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Oct 2021 04:24:26 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1962AC06161C
        for <linux-i2c@vger.kernel.org>; Tue, 19 Oct 2021 01:22:14 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id m26so16985050pff.3
        for <linux-i2c@vger.kernel.org>; Tue, 19 Oct 2021 01:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q4dXGZ3NpyXYFT6kSbI1+eF5ag5MVYmMy9y0dVt/g1s=;
        b=o5XP+ARvD/j0GyX9i6mY9geDotz1RLUZEED7x6esrPwjcyJt6NzkfSbG4x5elr8b24
         53kNa/hUilDY98HVZCh2IAE5+5wGFoMhkC05QzwjQTnVDJIBIRnGkHLGMriEIf+vvHI1
         qkMPKQCwdhllpvD8qowPHfCwjC2VfdsQ4HusggJwM8VlayAC7Xeox45lL3Mm0LGW4VOa
         PICfuwFx6yGs4nECVC+1WleqSl1u9v9Ti/dMxprOJITzMsibt4tylswFBWs/3ZOazJlY
         QveEBQ5UbjFYiMXEaK0otoh7ZH9uQ/cW+MlhXOGZTQ8Y+MCwMcxKlNiKMXifigrai2E6
         mYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q4dXGZ3NpyXYFT6kSbI1+eF5ag5MVYmMy9y0dVt/g1s=;
        b=JKodP/VnIk3Bvb6Yc0aQ9GDrzeALoe6gD2Lf0lxPl1vXztnwAXfbfS5kt7rENDBJnI
         0f/rRwayr2OSUoHTuZVY8tA/4ks3T31DFXdEXxm77NvLL0QF627AulzLtO1pURLS0I3u
         PghW/EKD5HkTNs3L1MaT15BO04t5+EoPBRtOzkVXIKv6CAjEjMSp9pV8wRXtVWmsPQYU
         mU2Ill4mxEeGN9/OQhGVkkz8rzCJMhkdS8aU8pZyEijIXYQSGBLPaJSMXAgXu1DX37yI
         7wSjttuhRuzkIO8nsGTYWS4yv7husqRnP3pp2jqRfSohrAt4+I4VoMiO+mQ2znAUHWe+
         oaJA==
X-Gm-Message-State: AOAM530ZvAUpbirkWxSc7SMmYnCaVlvWvbmiI5/bCcUNhnmzp8dMFENs
        qf1rAoxM721oW2Hy/FRUorrJphd2c7UQHA==
X-Google-Smtp-Source: ABdhPJx66YQtym98ASzCKZD8wkXrms3VZUZjaMJ52yR55kR/QXQmtyXnOwevtdfvnUQ36QXKW6UTIA==
X-Received: by 2002:a05:6a00:124e:b0:44d:cb39:40f6 with SMTP id u14-20020a056a00124e00b0044dcb3940f6mr12053599pfi.22.1634631733568;
        Tue, 19 Oct 2021 01:22:13 -0700 (PDT)
Received: from localhost ([106.201.113.61])
        by smtp.gmail.com with ESMTPSA id h1sm9040268pfi.168.2021.10.19.01.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 01:22:13 -0700 (PDT)
Date:   Tue, 19 Oct 2021 13:52:11 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     wsa@kernel.org, jie.deng@intel.com,
        virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH 2/2] i2c: virtio: fix completion handling
Message-ID: <20211019082211.ngkkkxlfcrsvfaxg@vireshk-i7>
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-3-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019074647.19061-3-vincent.whitchurch@axis.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19-10-21, 09:46, Vincent Whitchurch wrote:
>  static void virtio_i2c_msg_done(struct virtqueue *vq)
>  {
> -	struct virtio_i2c *vi = vq->vdev->priv;
> +	struct virtio_i2c_req *req;
> +	unsigned int len;
>  
> -	complete(&vi->completion);
> +	while ((req = virtqueue_get_buf(vq, &len)))
> +		complete(&req->completion);

Instead of adding a completion for each request and using only the
last one, maybe we can do this instead here:

	while ((req = virtqueue_get_buf(vq, &len))) {
                if (req->out_hdr.flags == cpu_to_le32(VIRTIO_I2C_FLAGS_FAIL_NEXT))
                        complete(&vi->completion);
        }

Since we already know which is the last one, we can also check at this
point if buffers for all other requests are received or not.

-- 
viresh
