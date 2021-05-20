Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B141138B939
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 23:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbhETVxv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 17:53:51 -0400
Received: from gloria.sntech.de ([185.11.138.130]:48878 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230178AbhETVxv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 May 2021 17:53:51 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1ljqah-0001n2-4H; Thu, 20 May 2021 23:52:27 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     lee.jones@linaro.org, Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Max Schwarz <max.schwarz@online.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 12/16] i2c: busses: i2c-rk3x: Demote unworthy headers and help more complete ones
Date:   Thu, 20 May 2021 23:52:26 +0200
Message-ID: <6083609.GXAFRqVoOG@diego>
In-Reply-To: <20210520190105.3772683-13-lee.jones@linaro.org>
References: <20210520190105.3772683-1-lee.jones@linaro.org> <20210520190105.3772683-13-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Lee,

Am Donnerstag, 20. Mai 2021, 21:01:01 CEST schrieb Lee Jones:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/i2c/busses/i2c-rk3x.c:242: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  drivers/i2c/busses/i2c-rk3x.c:261: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  drivers/i2c/busses/i2c-rk3x.c:304: warning: Function parameter or member 'i2c' not described in 'rk3x_i2c_prepare_read'
>  drivers/i2c/busses/i2c-rk3x.c:304: warning: expecting prototype for Setup a read according to i2c(). Prototype was for rk3x_i2c_prepare_read() instead
>  drivers/i2c/busses/i2c-rk3x.c:335: warning: Function parameter or member 'i2c' not described in 'rk3x_i2c_fill_transmit_buf'
>  drivers/i2c/busses/i2c-rk3x.c:335: warning: expecting prototype for Fill the transmit buffer with data from i2c(). Prototype was for rk3x_i2c_fill_transmit_buf() instead
>  drivers/i2c/busses/i2c-rk3x.c:535: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  drivers/i2c/busses/i2c-rk3x.c:552: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  drivers/i2c/busses/i2c-rk3x.c:713: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  drivers/i2c/busses/i2c-rk3x.c:963: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  drivers/i2c/busses/i2c-rk3x.c:973: warning: Function parameter or member 'i2c' not described in 'rk3x_i2c_setup'
> 
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Max Schwarz <max.schwarz@online.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/i2c/busses/i2c-rk3x.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index 819ab4ee517e1..1dfbd1185aefc 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -238,7 +238,7 @@ static inline void rk3x_i2c_clean_ipd(struct rk3x_i2c *i2c)
>  	i2c_writel(i2c, REG_INT_ALL, REG_IPD);
>  }
>  
> -/**
> +/*
>   * Generate a START condition, which triggers a REG_INT_START interrupt.
>   */
>  static void rk3x_i2c_start(struct rk3x_i2c *i2c)
> @@ -257,7 +257,7 @@ static void rk3x_i2c_start(struct rk3x_i2c *i2c)
>  	i2c_writel(i2c, val, REG_CON);
>  }
>  
> -/**
> +/*
>   * Generate a STOP condition, which triggers a REG_INT_STOP interrupt.

what made you decide between demoting and completing comments?
I.e. here you demot the "static void rk3x_i2c_stop()", while below
you for example complete the "static rk3x_i2c_get_spec()".

So I somehow do not yet see the pattern ;-)

Heiko


>   *
>   * @error: Error code to return in rk3x_i2c_xfer
> @@ -297,7 +297,7 @@ static void rk3x_i2c_stop(struct rk3x_i2c *i2c, int error)
>  	}
>  }
>  
> -/**
> +/*
>   * Setup a read according to i2c->msg
>   */
>  static void rk3x_i2c_prepare_read(struct rk3x_i2c *i2c)
> @@ -328,7 +328,7 @@ static void rk3x_i2c_prepare_read(struct rk3x_i2c *i2c)
>  	i2c_writel(i2c, len, REG_MRXCNT);
>  }
>  
> -/**
> +/*
>   * Fill the transmit buffer with data from i2c->msg
>   */
>  static void rk3x_i2c_fill_transmit_buf(struct rk3x_i2c *i2c)
> @@ -532,7 +532,7 @@ static irqreturn_t rk3x_i2c_irq(int irqno, void *dev_id)
>  }
>  
>  /**
> - * Get timing values of I2C specification
> + * rk3x_i2c_get_spec() - Get timing values of I2C specification
>   *
>   * @speed: Desired SCL frequency
>   *
> @@ -549,7 +549,7 @@ static const struct i2c_spec_values *rk3x_i2c_get_spec(unsigned int speed)
>  }
>  
>  /**
> - * Calculate divider values for desired SCL frequency
> + * rk3x_i2c_v0_calc_timings() - Calculate divider values for desired SCL frequency
>   *
>   * @clk_rate: I2C input clock rate
>   * @t: Known I2C timing information
> @@ -710,7 +710,7 @@ static int rk3x_i2c_v0_calc_timings(unsigned long clk_rate,
>  }
>  
>  /**
> - * Calculate timing values for desired SCL frequency
> + * rk3x_i2c_v1_calc_timings() - Calculate timing values for desired SCL frequency
>   *
>   * @clk_rate: I2C input clock rate
>   * @t: Known I2C timing information
> @@ -959,8 +959,8 @@ static int rk3x_i2c_clk_notifier_cb(struct notifier_block *nb, unsigned long
>  	}
>  }
>  
> -/**
> - * Setup I2C registers for an I2C operation specified by msgs, num.
> +/*
> + * rk3x_i2c_setup() - Setup I2C registers for an I2C operation specified by msgs, num.
>   *
>   * Must be called with i2c->lock held.
>   *
> 




