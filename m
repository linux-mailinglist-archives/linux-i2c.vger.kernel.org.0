Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 785E1D0223
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2019 22:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730523AbfJHUcE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Oct 2019 16:32:04 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33602 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727835AbfJHUcE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Oct 2019 16:32:04 -0400
Received: by mail-pf1-f193.google.com with SMTP id q10so75897pfl.0
        for <linux-i2c@vger.kernel.org>; Tue, 08 Oct 2019 13:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eG3/KTcN+l0J8/6h6CFjDe7V6XOLu3qvlhIP2AFfrys=;
        b=to94oEFRu7pxgY2G1Xez6EtBwR0f3yzChiGgys5tcUAprpjiFizEtLFTEfBhUswbwS
         +b6TW6lVGXl4mLAI4N3auzBq0yZMZCqptNh/Hrja7n2IfTO9vb/N15/IR8y0cnVkil3G
         XHH3y7a5zxQHC3wZYFFvm7Pqh5HXET1swlIRVWpE9Sywk5HGoA2nEoT+d/8bSrhOPgkA
         icePHEWyx6ekqLhZHjFp3fBjzhyj7hLulxxnd8XhpqLUycijtMwDhnxpgAq67FKnWR2y
         vdW6JNefJLtAVnRwzX/hGl9q6hjmdYUGPNbc/S+XjVI42xIfKYKlpbh7fzA40E8l+ekx
         UnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eG3/KTcN+l0J8/6h6CFjDe7V6XOLu3qvlhIP2AFfrys=;
        b=lr3KgfwJ7TegD+HxvXywfQGSfOjnZzHwUNgRXYmPvnPqfPn1jY3gedyNY151Q/v7wR
         w0kTNlWm48ArZ6DzKQsXqtqCz481S7YYp3cwvNBkJPdW0zv7UNu1XDV3NI1jzQA3HqbL
         8QkjDhb8gd7n+awntRoFlsNlt3WK+bZ4wOUhCb+CX4vy4JFqfqsxCQP8xZql2JrOOgyf
         +62TBjNwympSzkknLuXSWI5tC0pn8gQjk5K76oX92DNdqlpM1fY4KPal50hXWjLj1bgg
         N+56z/3XW1CJS3sgzZB314+0RzdieiwuAF3ApTuBbDIq/Vf3bxo138QXcVHM/+oqYxRt
         WfdA==
X-Gm-Message-State: APjAAAV5r634NxlDeKg+TAe/AB87iS1xeRAEbFG5vlExj+CW7o26eZA9
        6FCV5yA5CoTIHhwZE8brvyKZXw==
X-Google-Smtp-Source: APXvYqzuXMuOJlcRChpjsyL5D5qPR+4R8/wPvf3J5IUiMHTYlcl02d8LMjqeowAKe6J+zFd5NRArUw==
X-Received: by 2002:a62:e21a:: with SMTP id a26mr6636688pfi.80.1570566723059;
        Tue, 08 Oct 2019 13:32:03 -0700 (PDT)
Received: from google.com ([2620:15c:2cb:1:e90c:8e54:c2b4:29e7])
        by smtp.gmail.com with ESMTPSA id r18sm16766pfc.3.2019.10.08.13.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 13:32:02 -0700 (PDT)
Date:   Tue, 8 Oct 2019 13:31:57 -0700
From:   Brendan Higgins <brendanhiggins@google.com>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 3/5] i2c: aspeed: fix master pending state handling
Message-ID: <20191008203157.GA184092@google.com>
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
 <20191007231313.4700-4-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007231313.4700-4-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 07, 2019 at 04:13:11PM -0700, Jae Hyun Yoo wrote:
> In case of master pending state, it should not trigger the master
> command because this H/W is sharing the same data buffer for slave
> and master operations, so this commit fixes the issue with making
> the master command triggering happen when the state goes to active
> state.

nit: Makes sense, but can you explain what might happen without your
change?

> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Thanks!
